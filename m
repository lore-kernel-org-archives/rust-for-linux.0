Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EE33214
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 16:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E6CC433C8;
	Wed, 13 Sep 2023 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694624167;
	bh=qfeee3u9HFvX6brWEqvt42au+fwxP9D1K/7uey1Dwso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DfGK7Y9HtH9W/CDRKu1XkWuX5bHPwJQ+xc9SSvUheYvXmpJlxecqLJGWsuW3xBZRB
	 XsW5di6qCt96WJG3oV13FC2szlDQV1RMNmlRCQ2CwKMnb0JfEOUoM0x9gNldNHCF/9
	 D30Dax881iei63yAwFU34oSl6+GXJsiKc3Xpq6Fs=
Date: Wed, 13 Sep 2023 18:56:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <2023091348-agile-premises-53fb@gregkh>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913133609.1668758-5-fujita.tomonori@gmail.com>

On Wed, Sep 13, 2023 at 10:36:09PM +0900, FUJITA Tomonori wrote:
> +impl kernel::Module for RustAsixPhy {
> +    fn init(module: &'static ThisModule) -> Result<Self> {
> +        pr_info!("Rust Asix phy driver\n");

Meta-comment, when drivers are working properly, they are quiet.

Also, no driver should have pr_*() calls in them, they work on devices,
so the normal dev_*() calls should be used instead, if you have to print
anything out.

> +        let mut reg: phy::Registration<1> = phy::Registration::new(module);
> +
> +        reg.register(&phy::Adapter::<PhyAx88772A>::new(c_str!(
> +            "Asix Electronics AX88772A"
> +        )))?;
> +        Ok(RustAsixPhy { _reg: reg })
> +    }
> +}
> +
> +impl Drop for RustAsixPhy {
> +    fn drop(&mut self) {
> +        pr_info!("Rust Asix phy driver (exit)\n");

Again, drivers need to be quiet :)

thanks,

greg k-h
