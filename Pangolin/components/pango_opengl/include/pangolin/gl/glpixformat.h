/* This file is part of the Pangolin Project.
 * http://github.com/stevenlovegrove/Pangolin
 *
 * Copyright (c) 2014 Steven Lovegrove
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#pragma once

#include <pangolin/gl/glplatform.h>
#include <pangolin/gl/glformattraits.h>
#include <pangolin/image/pixel_format.h>
#include <stdexcept>

namespace pangolin {

// This class may dissapear in the future
struct GlPixFormat
{
    GlPixFormat() {}

    GlPixFormat(const PixelFormat& fmt)
    {
        switch( fmt.channels) {
        case 1: glformat = GL_LUMINANCE; break;
        case 3: glformat = fmt.format.substr(0, 3) == "BGR"? GL_BGR  : GL_RGB;  break;
        case 4: glformat = fmt.format.substr(0, 4) == "BGRA"? GL_BGRA : GL_RGBA; break;
        default: throw std::runtime_error("Unable to form OpenGL format from video format: '" + fmt.format + "'.");
        }

        const bool is_integral = fmt.format.find('F') == std::string::npos;

        switch (fmt.channel_bits[0]) {
        case 8: gltype = GL_UNSIGNED_BYTE; break;
        case 10: gltype = GL_UNSIGNED_SHORT; break;
        case 12: gltype = GL_UNSIGNED_SHORT; break;
        case 16: gltype = GL_UNSIGNED_SHORT; break;
        case 32: gltype = (is_integral ? GL_UNSIGNED_INT : GL_FLOAT); break;
        case 64: gltype = (is_integral ? GL_UNSIGNED_INT64_NV : GL_DOUBLE); break;
        default: throw std::runtime_error("Unknown OpenGL data type for video format: '" + fmt.format + "'.");
        }

        if(glformat == GL_LUMINANCE) {
            if(gltype == GL_UNSIGNED_BYTE) {
                scalable_internal_format = GL_LUMINANCE8;
            }else if(gltype == GL_UNSIGNED_SHORT){
                if(fmt.channel_bits[0] == 12) {
                    scalable_internal_format = GL_LUMINANCE12;
                }
                else if(fmt.channel_bits[0] == 10) {
                    scalable_internal_format = GL_LUMINANCE12; // there is no GL_LUMINANCE10
                } else {
                    scalable_internal_format = GL_LUMINANCE16;
                }
            }else{
                scalable_internal_format = GL_LUMINANCE32F_ARB;
            }
        }else{
            if(gltype == GL_UNSIGNED_BYTE) {
                scalable_internal_format = GL_RGBA8;
            }else if(gltype == GL_UNSIGNED_SHORT) {
                if(fmt.channel_bits[0] == 10) {
                    scalable_internal_format = GL_RGB10;
                } else if(fmt.channel_bits[0] == 12) {
                    scalable_internal_format = GL_RGB12;
                } else {
                    scalable_internal_format = GL_RGBA16;
                }
            }else{
                scalable_internal_format = GL_RGBA32F;
            }
        }
    }

    template<typename T>
    static GlPixFormat FromType()
    {
        GlPixFormat fmt;
        fmt.glformat = GlFormatTraits<T>::glformat;
        fmt.gltype = GlFormatTraits<T>::gltype;
        fmt.scalable_internal_format = GlFormatTraits<T>::glinternalformat;
        return fmt;
    }

    GLint glformat;
    GLenum gltype;
    GLint scalable_internal_format;
};

}
