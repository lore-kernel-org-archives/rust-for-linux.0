Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0A27A103
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764057; cv=none; b=LukjQfUPCgMRiRHkZYxmZPWqqxTpSiix6XfPAfiLR5W0y3kl77unJhj4YGh0czPbXUfKAk1nb4FFAZJMyudQKGgeHP+/d46jfRZFo94mLduBlmb7PZAchWcSIFMeHw3BMC2GAUWa2EndRPINksMDcrsopvdsvts7VTGa00tO69E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764057; c=relaxed/simple;
	bh=Kw2pUv2viJveNcOGTQXBz8zzVYV8HedyAoJfCapJJCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWcqny3l+soRmaRWSMsNLwmd/ajygnWtcx6D1oUyExH/yQist2naY/8NQYCh1g1azesP6Ivv+IKPOC5K8kHGF1dQEMY5neGEwb0/1UT7vDFDQC+W1Um2WN60jsbv/WW76fV3UF/Si3gYF+tk0JiPi7hTWZyQiA5kkP/GiexmJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/Aih0vF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/Aih0vF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E63C4CEE3;
	Tue, 24 Jun 2025 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750764057;
	bh=Kw2pUv2viJveNcOGTQXBz8zzVYV8HedyAoJfCapJJCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/Aih0vF3+biZTJqvMRhnobGM1e1Brp+ocdG21PiDLZ4BadSV9X6ihFdH5sKco+RA
	 zNuyvzQfe7e7CQjbvKKmqfbqteFEee4jzBQgyw5hv5bKU/EojZ6nWTasJKHXPezqsi
	 BQz3OTMEBqhzBvJSchBmM3mZ60kFcfCQwx3KwBe0WVOFz2Lg8JMEd+JOyfkkuToJ9I
	 eKs4DkGrODW21ZvF1Cr9NyjTfzWNcrU687eXO+72Q0m5JGtlaYMqkguoj2QPZ2YHzy
	 whg3Xiopv4npPfI2XS5t45HE61fGHryVgJPbO6ii606X46wyQvmOuomOwu/FRrTNih
	 J/VoEf41qIB1A==
Date: Tue, 24 Jun 2025 13:20:51 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	daniel.almeida@collabora.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
	lyude@redhat.com, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm: nova-drm: Update ioctl handlers to drop
 Opaque usage
Message-ID: <aFqKE4UJqMp9nVR4@pollux>
References: <20250624093200.812812-1-beata.michalska@arm.com>
 <20250624093200.812812-3-beata.michalska@arm.com>
 <0ba4c988-194a-46f6-8e5d-b8fbc95a3eb8@kernel.org>
 <aFqHWOl0XcDdOrlN@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFqHWOl0XcDdOrlN@arm.com>

On Tue, Jun 24, 2025 at 01:09:12PM +0200, Beata Michalska wrote:
> On Tue, Jun 24, 2025 at 11:59:25AM +0200, Danilo Krummrich wrote:
> > On 6/24/25 11:32 AM, Beata Michalska wrote:
> > > From: Danilo Krummrich <dakr@kernel.org>
> > > 
> > > Following the removal of `Opaque<T>` for ioctl arguments in the DRM
> > > framework, this patch updates the affected driver code to use typed
> > > references directly.
> > > 
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > 
> > It's very kind you want to attribute the shared diff with a separate patch, but
> > you have to include this change into patch 1 ("rust: drm: Drop the use of Opaque
> > for ioctl arguments"), otherwise it still breaks the build intermediately.
> >
> It is not so uncommon to send such changes in separate patches, to clearly
> distinguish the changes, as long as whole series preserves the build.
> That said, I can still send those as a single patch if that is the requirement.

I think it is very uncommon; the general rule is that no patch should ever break
the build.

From [1]:

"When dividing your change into a series of patches, take special care to ensure
that the kernel builds and runs properly after each patch in the series.
Developers using `git bisect` to track down a problem can end up splitting your
patch series at any point; [...]"

[1] https://docs.kernel.org/process/submitting-patches.html#separate-your-changes

> > Please feel free to just include the change in your patch -- no need for any
> > attribution as far as I'm concerned. :)
