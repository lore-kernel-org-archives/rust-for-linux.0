Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A772C848
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711530789; cv=none; b=Ug9ajrZGPUcbRPL7W6BL0ZO95/CAox3K8fylho6LJLxyKKLRIjqIb4kfQWAT/tS/4JS1oAwdnFXlC43WPxnsYqnEwUPkWCYoowCb/aWg2ePzvl5kH5imkGb5fouUVU+Sfwk2mtUqB8slZXCPnTun8GNC73u8Bwd6andvpDibCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711530789; c=relaxed/simple;
	bh=23oiM3VF61FT/0f8zyM4/HL6sW4bQtzpj3SCE778ZMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX9IDYsWWformeOiw9YUpIQ41SPlNZmswhmZ2rKB0co9/xaoyIjUMrkwYT416OtBBZ5rkHp+Ty7S6fqOZw2kDCAPPwxe2QKe473oKkR4EWLRaK1fMbQEpj66Mz3mtXwCGHdkrk2asSBdmlundzTJtX2MgHnmdkBuHdICTeE6T+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OxZ2qh+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OxZ2qh+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F281C433C7;
	Wed, 27 Mar 2024 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711530789;
	bh=23oiM3VF61FT/0f8zyM4/HL6sW4bQtzpj3SCE778ZMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxZ2qh+asCUef12ILoEbKt3z/VZaf9oStopmycTqQsQWAByzkdHtj9MuwO0bHoswO
	 ZewSXpdz9ip8oky67S4+CE34lk3cIYrnoIPr7AuGLQkZDsUDDcjhpZPx/Pa+u6p8CM
	 bX/QVbmKN+8mKfD/EswnyHeNe6QIz98LyeNedu6c=
Date: Wed, 27 Mar 2024 10:13:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <2024032730-clamor-anything-ce16@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
 <CANeycqqQjSqA8CK66wyaNnSckr2GNDtfEUv_Tm29WbzAs7Njzg@mail.gmail.com>
 <2024032703-mobile-perch-0a55@gregkh>
 <dc21d9dc9be739122e60caefa0f75ac29bd2a3c7.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc21d9dc9be739122e60caefa0f75ac29bd2a3c7.camel@redhat.com>

On Wed, Mar 27, 2024 at 10:05:51AM +0100, Philipp Stanner wrote:
> Regarding the feedback from the thread from a year ago: Assuming we
> implement as much of that as possible, could we get back at you with
> follow up questions and discussions here in this thread?

I'm always willing to review patches, just not patches where previous
review comments are ignored, for obvious reasons.

thanks,

greg k-h
