Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87996199B8;
	Mon,  9 Oct 2023 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CWD60o5Z"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D6AC5;
	Mon,  9 Oct 2023 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=h6Ctl5yhk4pGnk083whbAElUsyX+5CKRMlZboSeAY9w=; b=CW
	D60o5Za2Wy5hstIHqq0ohQ/3aYuLgFB0Vf43KOyI4vhQyvLjS3whHkjeFhKFwoJfuBVugt4RnykJ+
	KzNFKUJMVhfAAuobn0XtmlgnAzFna1wMcrU2mwZycTJJiII7uWS5EKhm4Ubw6XLSCCY/DjGkHSoLJ
	rtWOJCiSQQEBFj8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qprgS-000uWU-E8; Mon, 09 Oct 2023 16:56:36 +0200
Date: Mon, 9 Oct 2023 16:56:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, greg@kroah.com, tmgross@umich.edu
Subject: Re: [PATCH net-next v3 0/3] Rust abstractions for network PHY drivers
Message-ID: <a3412fbc-0b32-4402-a3c8-6ccaf42a2ee4@lunn.ch>
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com>
 <5334dc69-1604-4408-9cce-3c89bc5d7688@lunn.ch>
 <CANiq72n6DMeXQrgOzS_+3VdgNYAmpcnneAHJnZERUQhMExg+0A@mail.gmail.com>
 <ZSQMVc19Tq6MyXJT@gpd>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSQMVc19Tq6MyXJT@gpd>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09, 2023 at 04:21:09PM +0200, Andrea Righi wrote:
> On Mon, Oct 09, 2023 at 02:53:00PM +0200, Miguel Ojeda wrote:
> > On Mon, Oct 9, 2023 at 2:48 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > Any ideas?
> > 
> > That is `RETHUNK` and `X86_KERNEL_IBT`.
> > 
> > Since this will keep confusing people, I will make it a `depends on !`
> > as discussed in the past. I hope it is OK for e.g. Andrea.
> 
> Disabling RETHUNK or IBT is not acceptable for a general-purpose kernel.
> If that constraint is introduced we either need to revert that patch
> in the Ubuntu kernel or disable Rust support.
> 
> It would be nice to have a least something like
> CONFIG_RUST_IS_BROKEN_BUT_IM_HAPPY, off by default, and have
> `RUST_IS_BROKEN_BUT_IM_HAPPY || depends on !`.

Should this actually be CONFIG_RUST_IS_BROKEN_ON_X86_BUT_IM_HAPPY ?

At lest for networking, the code is architecture independent. For a
driver to be useful, it needs to compile for most architectures. So i
hope Rust will quickly make it to other architectures. And for PHY
drivers, ARM and MIPS are probably more important than x86.

	Andrew
