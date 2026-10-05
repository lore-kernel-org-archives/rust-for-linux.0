Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5741430CE3;
	Mon,  5 Oct 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240658; cv=pass; b=uABefk564mHuKruGgI9dKzt/10YYEFUCXHlniHA3xtwXvypdB2PUt5lLrRQCFj9Bw8Loo0+11NynBlyznGQhmo/o90CmEyYrvrJD/wqi1AuVUpmdAgriuPPGPkKKjGzRcwHDLO3R9NZSEW3Oq+zzYCMsg7nUfsvUSN666RNmXq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240658; c=relaxed/simple;
	bh=sKhhgUSJuaJL8KrQtLnFNYByYG51zlZ6EFyAVdKBbr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPtiCXcugegHyfUrqtsBRGrK3pqPsysWs74jLCySoD7ISWzwrNXg1xYas5Hos5y4uMmYOlu1hgy1tapyKUxotx0OVzk4vlFcsPdADySQEyfPi6FyvApTW4o7D0uM/WRNVQVDfgXaXwOg7I6buSGf1c/FMkQ25HDnUY7KJyie3lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=SRmHVdAT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="SRmHVdAT"
ARC-Seal: i=1; a=rsa-sha256; t=1791240638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jh63C9b67OMvdyZnfpnmUZVBGeJBqq/rgdSJlrZRM7kJwpMttngOLMTK+gkhQNV6oCYCCxsXs6lW5pChc9XzWwEg2sacVdCr99BM9pj8he0zYLzlxL8FsfdRQotLwV6/YEyVzdgWxk1RfDUFEP3uGZfJAx07G6eeI0jOHkmMWZc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791240638; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UbtGUo1VB4svddh9QcS4nYLUaMaEJTQQu6SoYBGLeYg=; 
	b=NwA0UtAZiWrQ8LFOL25eguMJFqKKPG89q5dRsh4h3Oju9ImqTUR2rpGpVmYpOMy+v+vWN0ZfQjgCt0JUe6LAujbtiGEAEQjPApKZwdRDghxnJOmcxQBN/CptagzTGiP9nhkM6eZ0wuT5M0znRf9zysemZnSwi4e5v4kPXTmh5KU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791240638;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=UbtGUo1VB4svddh9QcS4nYLUaMaEJTQQu6SoYBGLeYg=;
	b=SRmHVdATiV5BoSTcL/YrxVpMYyEoa8zkqWkEMuhvWwzsxp84EQBBomaRFPoJJrtk
	Lu5AM3d35lWLasYwn0azG0/Mlau2i2Lh+yI3I13gMcBZHc3wNWZMFTt9zD9u79TS8Ck
	n3Xv7Bi2wKt3k2WKuClZPQWNZIQeHWug0sdYZlFY=
Received: by smtp.zohomail.com with SMTPS id 1791240636373208.34213726082373;
	Mon, 5 Oct 2026 15:50:36 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:50:35 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/tyr: safely write GpuInfo to userspace
Message-ID: <asQpu3c6fCt0_B5V@um790>
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-2-e19bcb71980d@collabora.com>
 <DLPEHBOTZCCU.1DFPII93RC6LA@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLPEHBOTZCCU.1DFPII93RC6LA@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.236.60

On Sat, Sep 26, 2026 at 06:48:49PM +0200, Danilo Krummrich wrote:
> On Sat Sep 26, 2026 at 2:26 AM CEST, Deborah Brouwer wrote:
> > @@ -54,7 +54,7 @@ pub(crate) fn dev_query(
> >                      )
> >                      .writer();
> >  
> > -                    writer.write(&reg_data.gpu_info)?;
> > +                    writer.write_slice(reg_data.gpu_info.as_bytes())?;
> 
> I think we eventually want write() to require T: IntoBytes + Immutable, so I'm
> not sure there is much value going back and forth with this.

We could change UserSliceWriter::write to require T: IntoBytes + Immutable, but since
rust_binder_main.rs uses UserSliceWriter also, it’s not a trivial change.

There is value in changing this for Tyr because currently Tyr has an unsafe
implementation of AsBytes and since the panthor uapi is under development I think it
would be nicer to have a compile time check.

