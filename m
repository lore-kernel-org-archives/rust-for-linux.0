Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48437A
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 01:37:02 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF2EE8
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 18:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=aSRKuyzfnQNMq7OV8saLFfkI71wV5inrtW9rl4FSlD0=; b=Jp
	Xjz/osCG8keWjzNUhXFOtehHliXH9yed4Rm8pdd+ld0OhAclX/iau5p9RG85H/AqN/kOP4EtC4qbw
	X3meuBkI4LLFOkZ6jkag7rVkR6OZ1iEF3qXMKMYss6w180uv4uU10Er7jBFP9Re2fMLb/OHX9QGbA
	GIoRStIGyzM79Jo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qjrZp-007GZi-Nb; Sat, 23 Sep 2023 03:36:57 +0200
Date: Sat, 23 Sep 2023 03:36:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file
 to the ETHERNET PHY LIBRARY
Message-ID: <3dc9a1ea-fb04-4b9e-abf9-08165ea3b8c5@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com>
 <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com>
 <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
 <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch>
 <CANiq72nkmL5jEqdnj+OoDk+Vja_jVUdD+EGneF3h+kdFSOJqPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nkmL5jEqdnj+OoDk+Vja_jVUdD+EGneF3h+kdFSOJqPA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 23, 2023 at 02:05:45AM +0200, Miguel Ojeda wrote:
> On Tue, Sep 19, 2023 at 6:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > So a question from a none Rust person. Why would it need to be in the
> > 'kernel' crate?
> 
> Sorry, I missed this one.
> 
> Rust requires to perform some work on dependencies given there are no
> headers. One could definitely put the abstractions elsewhere, but
> properly sharing them requires a more involved build system. Thus, for
> simplicity, abstractions go for the moment in a single translation
> unit (called the `kernel` crate) that gets compiled first.

My limited understanding of the Kernel Makefiles is that they all end
up being one huge Makefile. So i think in principle you can place the
files anywhere, and direct any object file towards any target. So i
think you should be able to put the file for the kernel crate anywhere
in the tree.

I would prefer to keep the Rust file next to the C file to make
Maintenance easier. We are less likely to make breaking changes if
everything is kept together in the source tree.

	Andrew
