Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC48199CC
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="AOpfC0d6"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1D791
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 08:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=srPVIY0cp/t0XrvT+NLgIrdnQSTAsWLGz02ujlOB8fg=; b=AO
	pfC0d6hCplpFaAc4CYg8y4FDN6+T1DB80R41ZDZf2EKWg5XrqHGguisrqHqSk+reXvRefdCNwklUk
	2A1QBGD3iUJK706r89fz0utdPf8tr6hQrFbcs1dFEPovAnV1uVzRLQb4YoHmJtpwmq/AX9FCcCuWb
	AuPSI27ikoMOoDI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qpsWm-000vU9-UR; Mon, 09 Oct 2023 17:50:40 +0200
Date: Mon, 9 Oct 2023 17:50:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
	benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <69ec5900-1baa-4a62-b0a4-ee75b12db5c6@lunn.ch>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
 <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
 <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
 <78da96fc-cf66-4645-a98f-80e404800d3e@lunn.ch>
 <CANiq72n3kHrJKXApx2eZ6MFisdoh==4KQi2qHYkxmDi=TYaHew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n3kHrJKXApx2eZ6MFisdoh==4KQi2qHYkxmDi=TYaHew@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09, 2023 at 02:25:40PM +0200, Miguel Ojeda wrote:
> On Mon, Oct 2, 2023 at 9:08 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > The kernel is documented using kerneldoc. It would seem odd to me to
> > have a second parallel set of Documentation for Rust. Just like Rust
> > is integrated into the kernel tree, is configured using Kconfig, built
> > using make at the top level, i would also expect it to integrate into
> > kerneldoc somehow. I see the Rust API for PHY drivers next to the C
> > API for PHY drivers. Its just another API in the kernel, nothing
> > special.
> 
> There are several differences that make it unlike other kernel APIs.
> For instance, the Rust abstractions cannot be (in general) used by C
> [*]. Many concepts simply have no equivalent in C.
>
> Furthermore, the goal is to develop safe APIs in Rust that then Rust
> modules can use. Modules are not supposed to mix the C and the Rust
> API, so ideally a Rust module developer needs to only care about the
> Rust APIs.

For PHY drivers, not is not going to be true. Rust PHY drivers are
always going to be calling in C code to do most of the work, because a
lot of what PHY drivers do are define in IEEE 802.3, and we have a
huge number of helpers following 802.3. A PHY driver basically just
glues those helpers together, and deals with hardware/firmware bugs.
So to me, i expect the Rust binding documentation to be next to the C
documentation for all these helpers. That is what a PHY driver write
needs.

So having the documentation here:

https://elixir.bootlin.com/linux/latest/source/Documentation/networking/kapi.rst#L107

would be great. I don't really care if it has a different look and
feel, its the content which is important.

Are PHY drivers unique like this? I don't think so. MAC drivers make
use of a large number of helpers for handling chunks of memory holding
Ethernet frames. So ideally the binding for MAC drivers should not be
too far away from the documentation all those helpers.

I would agree there are some drivers which don't have many helpers
from the subsystem, so this split model would work for them. gpio,
hwmon are probably good examples of that which come to mind.

> In addition, the Rust native documentation system is quite good at
> what it does. If there exists a Rust plugin for Sphinx that is good
> enough, then yeah, we could use it.

I think the first step is just getting the rustdoc generated HTML
integrated somehow. We can work on look and feel later.

	   Andrew


