Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6084221F17
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763370; cv=none; b=kEqb5sMBegQfXSoWd5/aFuo50VMhlO+BcJ5QH35oEzcR7HMBuVEI5lN9eXyHaAJf2vuLdj6p7fY6i5yQOP2NakLs2H8doSIKwGFBR5a+4fxRw4gISNIcb9Wp9attk9ZafvigPXk+9lBeeA+axypGhqr8fph/Z6lG8eBynD7vJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763370; c=relaxed/simple;
	bh=CTPhbo8se9svw/pHkT1sCo49DQwCyHA3m8bcbxjlYQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z84DdOvdExuqI6eh3fK8TNusbu1c5xIK1PjaGilWLZQwnigpGAkWN48o1DiJhfbTnrHnx+y5aVFcLYurXM+qSXN4Nmpdo7bjHokcvb0rj7HgFjz7fY+FUkXKPm4069uykKGOdr8mwtxS6Gs2AGxRGejX2/5BImL4uKsxhJO4IPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BF4106F;
	Tue, 24 Jun 2025 04:09:08 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3CD23F66E;
	Tue, 24 Jun 2025 04:09:21 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:09:12 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	daniel.almeida@collabora.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
	lyude@redhat.com, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm: nova-drm: Update ioctl handlers to drop
 Opaque usage
Message-ID: <aFqHWOl0XcDdOrlN@arm.com>
References: <20250624093200.812812-1-beata.michalska@arm.com>
 <20250624093200.812812-3-beata.michalska@arm.com>
 <0ba4c988-194a-46f6-8e5d-b8fbc95a3eb8@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ba4c988-194a-46f6-8e5d-b8fbc95a3eb8@kernel.org>

On Tue, Jun 24, 2025 at 11:59:25AM +0200, Danilo Krummrich wrote:
> On 6/24/25 11:32 AM, Beata Michalska wrote:
> > From: Danilo Krummrich <dakr@kernel.org>
> > 
> > Following the removal of `Opaque<T>` for ioctl arguments in the DRM
> > framework, this patch updates the affected driver code to use typed
> > references directly.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> 
> It's very kind you want to attribute the shared diff with a separate patch, but
> you have to include this change into patch 1 ("rust: drm: Drop the use of Opaque
> for ioctl arguments"), otherwise it still breaks the build intermediately.
>
It is not so uncommon to send such changes in separate patches, to clearly
distinguish the changes, as long as whole series preserves the build.
That said, I can still send those as a single patch if that is the requirement.

---
BR
Beata
> Please feel free to just include the change in your patch -- no need for any
> attribution as far as I'm concerned. :)
