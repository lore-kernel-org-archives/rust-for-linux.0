Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C11D53B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 19:08:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0B9DD
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ZPGU/ipfU9Q6UR9rE2JCXgt2YEjq7LxlCkmc0wFSO6E=; b=DR
	bNnhw4eW/w10KRFo93Rxtd/7VMoMKu9pxD5tNAB6FP3pj5T6xCe94nhLxlp/tsRt7mGx49ferXZVY
	hNss2Hb8/OiR7uI/s4w+p9jtf4CYOnYA0ZKzPmp/hRXaxjOAoDEaNnriKknn2N5qshNaaOjtnRwKM
	EcwprR1gkYlsksg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qnOHR-0082w3-55; Mon, 02 Oct 2023 21:08:33 +0200
Date: Mon, 2 Oct 2023 21:08:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
	benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <78da96fc-cf66-4645-a98f-80e404800d3e@lunn.ch>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
 <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
 <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 02, 2023 at 06:24:33PM +0200, Miguel Ojeda wrote:
> On Mon, Oct 2, 2023 at 4:08 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > Can we expect to see a section maybe referenced in
> > https://docs.kernel.org/next/networking/phy.html generate from the
> > Rust code?
> 
> If I understand correctly, you are asking about having the Rust docs
> linked within the C docs, rather than the other way around, right?

The kernel is documented using kerneldoc. It would seem odd to me to
have a second parallel set of Documentation for Rust. Just like Rust
is integrated into the kernel tree, is configured using Kconfig, built
using make at the top level, i would also expect it to integrate into
kerneldoc somehow. I see the Rust API for PHY drivers next to the C
API for PHY drivers. Its just another API in the kernel, nothing
special. I just use 'make htmldocs' at the top level and out come the
HTML documentation in Documentation/output/

But kerneldoc is not my subsystem. MAINTAINERS say:

DOCUMENTATION
M:      Jonathan Corbet <corbet@lwn.net>
L:      linux-doc@vger.kernel.org
S:      Maintained

So this discussion should really have Jonathon Corbet involved, if it
has not already been done.

    Andrew
