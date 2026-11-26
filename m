Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795730674;
	b=P/GY2yhOkeNhgQJBGTSqlOA104bUuOXeMKlYFK/t5xOUncjaDR/9GD6V6ujhPg6kwEMO
	 cMky2yrBwg09yYDGMHuCAp68kwhOYNzl+nzgwsYaTAg27sTJJCN4D9MwyJ3r2VMZtnj9c
	 evhcCw3yeEI7RNlzn2A+V3Tv5XZI34jAU6bgd+V1STM9HL9QAH7txTnrc30IkRNXIP4Vu
	 aas35ZfSiQsB1SOD3si0EvPJyZqk/ftMeF1KLRIygvkTOqUgGnY3AwdSGqGKVINmnQ/1D
	 EaXWT19Oq20tkR2Yz3ItJL/ebRnSXdQOfEEuZnkYYlbHTUzt9DGAzNlNbttUfMiC5PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795730674;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp;
	bh=hw8McZrr/i2QtioNMt/2FPRki729VlIIyXqALDbuHl4=;
	b=Fjwu28S5SRQuXh67eXGTeOHgPJzIvxFE/oaCPn2O2uU3K7D9F0g9xkmMm6ER910a1XW7
	 Gz/vptR+lGUFY53s3aouEDDASsaTVA2pFHZoUFiWVASFSa3IErar/sDPn2gasFUy2EfFN
	 kSeb+/J/6o2u5vJljoHkIiJBMWsl0YgCOxCWUVTFs5jL4E4OWA50jix34wMRamq9hZLj0
	 O8hILW6YNpxq+EFm6hclf9XJAnzHkrW3UphE4CHDbAStY6zMUl+j2ImxPq6hhDW9gJ77j
	 8azz7Qmh6x/1WuCPQXDbzRiMmaL1kQQUCOoetsvaiLWI3aE53sKsMBM51iXx4DC3R/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WXgWcauu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44620606A31E;
	Thu, 26 Nov 2026 22:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44620606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WXgWcauu
ARC-Seal: i=1; a=rsa-sha256; t=1795730621; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jl4wLsYDawNtwcnNWjsiarBQT18RpY78MB2KUO7tJYCv8ZZ17p4wYCekosi0fYt3l0u6g73nUTjNaEtC6qqYVVwDHPHVGvHZ9DCa8lKLXF52X9iWkstfrqxbcFCAl+zad9MfAXgBjk1hwmb1LraU4/1is2CXTTWF6g+T+U/lQ8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795730621; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hw8McZrr/i2QtioNMt/2FPRki729VlIIyXqALDbuHl4=; 
	b=RyV56JSPBKt7QOYgEix4RRuFZG/vtHWcqx1gg1SUXfya71zTkBV7itSfFoQVljXtN0YRkiusaaFIlJ8vbtn9KCrYnHE0h3cLpZsmx4OZCIEgvFZAADYaUifQBCvMpyyz/SX5VQKZsyq+ys6t0kGlcYaAA88dL+5lWLLc033LX/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: a=rsa-sha256; b=WXgWcauuzQ8XqJsNMtnuE4jqjmZ2MD0uqLmTQrJGPz37XktCGFJFitZ0PjooVV0FLHYke3PFaovdiN1TQGD3YIUMfPbatM5n9jkaeQAATvPCL+MOvLEDn8uT50vL18z3TsIEm6RdiSvtWBHJLFr4XcICZpmi/SJ0sVKO48QlHxs=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=hw8McZrr/i2QtioNMt/2FPRki729VlIIyXqALDbuHl4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795730618243839.0715114063554;
	Thu, 26 Nov 2026 14:03:38 -0800 (PST)
Date: Thu, 26 Nov 2026 15:03:37 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sami Tolvanen <samitolvanen@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
Message-ID: <awisuf9_rnn2PUdK@um790>
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
 <awXA70GWssuU991c@google.com>
 <20261125113846.GB372978@robin.jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125113846.GB372978@robin.jannau.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.709.99

On Wed, Nov 25, 2026 at 12:38:46PM +0100, Janne Grunau wrote:
> On Tue, Nov 24, 2026 at 04:53:03PM +0000, Alice Ryhl wrote:
> > On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> > > +        // SAFETY: The DRM shmem helper only invokes this callback for a registered DRM device of
> > > +        // type `T::Driver`, which is `Self`'s driver per the `AllocImpl` impl below.
> > > +        let dev: &Device<T::Driver> = unsafe { Device::from_raw(raw_dev) };
> > 
> > `drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:
> > 
> >     type Object: AllocImpl;
> > 
> > without any constraint that `T::Object::Driver = T`. I think we should
> > introduce one similar to how Driver::File constrains this?
> 
> so changing it to `type Object: AllocImpl<Driver = Self>;`?
> 
> I think it's hard to get that accidentally wrong but since the change
> relies on that constraint and we can express it sure.
> 
> I added it locally for v3 but feel free to make that change before
> pushing this series to drm-rust-next if there is nothing else that
> warrants a v3.

Yeah, I agree the change is good, it's also similar to the constraint
on type Object for trait DriverGpuVm.

> 
> Janne
