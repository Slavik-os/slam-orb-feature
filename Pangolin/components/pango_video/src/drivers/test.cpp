/* This file is part of the Pangolin Project.
 * http://github.com/stevenlovegrove/Pangolin
 *
 * Copyright (c) 2013 Steven Lovegrove
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

#include <pangolin/video/drivers/test.h>
#include <pangolin/factory/factory_registry.h>
#include <pangolin/video/iostream_operators.h>

namespace pangolin
{

void setRandomData(unsigned char * arr, size_t size){
  for(size_t i = 0 ; i < size;i++) {
//      arr[i] = (unsigned char)(i * 255.0 / size);
      arr[i] = (unsigned char)(rand()/(RAND_MAX/255.0));
  }
}

TestVideo::TestVideo(size_t w, size_t h, size_t n, std::string pix_fmt)
{
    const PixelFormat pfmt = PixelFormatFromString(pix_fmt);

    size_bytes = 0;

    for(size_t c=0; c < n; ++c) {
        const StreamInfo stream_info(pfmt, w, h, (w*pfmt.bpp)/8, 0);
        streams.push_back(stream_info);
        size_bytes += w*h*(pfmt.bpp)/8;
    }
}

TestVideo::~TestVideo()
{

}

//! Implement VideoInput::Start()
void TestVideo::Start()
{

}

//! Implement VideoInput::Stop()
void TestVideo::Stop()
{

}

//! Implement VideoInput::SizeBytes()
size_t TestVideo::SizeBytes() const
{
    return size_bytes;
}

//! Implement VideoInput::Streams()
const std::vector<StreamInfo>& TestVideo::Streams() const
{
    return streams;
}

//! Implement VideoInput::GrabNext()
bool TestVideo::GrabNext( unsigned char* image, bool /*wait*/ )
{
    setRandomData(image, size_bytes);
    return true;
}

//! Implement VideoInput::GrabNewest()
bool TestVideo::GrabNewest( unsigned char* image, bool wait )
{
    return GrabNext(image,wait);
}

PANGOLIN_REGISTER_FACTORY(TestVideo)
{
    struct TestVideoFactory final : public TypedFactoryInterface<VideoInterface> {
        std::map<std::string,Precedence> Schemes() const override
        {
            return {{"test",10}};
        }
        const char* Description() const override
        {
            return "A test video feed with pixel-wise white noise.";
        }
        ParamSet Params() const override
        {
            return {{
                {"size","640x480","Image dimension"},
                {"n","1","Number of streams"},
                {"fmt","RGB24","Pixel format: see pixel format help for all possible values"}
            }};
        }
        std::unique_ptr<VideoInterface> Open(const Uri& uri) override {
            ParamReader reader(Params(), uri);
            const ImageDim dim = reader.Get<ImageDim>("size");
            const int n = reader.Get<int>("n");
            std::string fmt  = reader.Get<std::string>("fmt");
            return std::unique_ptr<VideoInterface>(new TestVideo(dim.x,dim.y,n,fmt));
        }
    };

    return FactoryRegistry::I()->RegisterFactory<VideoInterface>(std::make_shared<TestVideoFactory>());
}

}
