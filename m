Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE62C326D
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774159; cv=none; b=oJmil9AAn6krizUsgvISMpL6+VaiWweN+LCH3m9rUxUoQnAfxa0cClYxQ0Jrrpoz5EhsUMIWeDlh4oMLZwgA7pY5deIpc7Us5ozLhH3Vo7I9cVcTjFjDdiF+SmAqgcHWPgBuflejSkaEd6XHLuWk/KKqcx4iuRSkftJfefCRPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774159; c=relaxed/simple;
	bh=N9FFUmIdDzVMU8XsJRCCmoPnShJDK1x8yp/Sugg6+iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIUoADr/jC7xhyz57Agon5dvT5hJs4g4BR+7ieH3LcjaeTGq9xq7rVZDHYxazqMj+XZsF7BregF8vV4vKk9ulL9iaMcejZ30i4q1GWuDbOSRIoXp5fkq4hjEoTpf37aHsjs+YNaPNi9os4VeYP3HPkwUugWZzqMcsuuHleE75TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqymA6bO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqymA6bO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E5FC4CEE3;
	Tue, 24 Jun 2025 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750774159;
	bh=N9FFUmIdDzVMU8XsJRCCmoPnShJDK1x8yp/Sugg6+iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqymA6bOfjgmSBBYC8KvTYLoY2Fq4JzsZf5a4Crbr4RuU0GSagPpMnYnTKUvUaf3A
	 prkvZQ78pu948053uqmFodxfpwVFxEEUbo/0OSliobF52Eey/eTEZXEpXt5aOJt5Xo
	 /ErkUreEosCfgiPfOfq08ofbBKg1oFQ/IQJeFzNIlgZi3eeoIuhUySbosmSBJ5igeh
	 3VXy7Zsa+oEZbYSTDfxUThWxsfkWQOaoK6v00n0gru84oEEEuXAfhfPJqL6kYLtg6D
	 ymqrj33zjM3km4Yn0ufGPthuaInGM44NXnhES3TRmMG8MekVAqgDWo0u15l8lOisWr
	 k/4vbhkex8tjA==
Date: Tue, 24 Jun 2025 16:09:15 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: impl From for u32 for enums used
 from register!
Message-ID: <aFqxi7AvQiBLl528@pollux>
References: <20250624132337.2242-1-dakr@kernel.org>
 <DAUT7K6AFAXI.I6R4SBSYLRKP@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAUT7K6AFAXI.I6R4SBSYLRKP@nvidia.com>

On Tue, Jun 24, 2025 at 10:48:57PM +0900, Alexandre Courbot wrote:
> On Tue Jun 24, 2025 at 10:23 PM JST, Danilo Krummrich wrote:
> > Implement From for u32 for all enum types used within the register!()
> > macro.
> >
> > This avoids a conflict with [1] as reported in [2].
> >
> > Cc: Alexandre Courbot <acourbot@nvidia.com>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
> > Link: https://lore.kernel.org/all/20250624173114.3be38990@canb.auug.org.au/ [2]
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Also confirmed that Ampere still successfully probed with this:
> 
> Tested-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> One small comment and question below.
> 
> > ---
> >  drivers/gpu/nova-core/falcon.rs | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> > index 07be1c30668c..1affffb109ec 100644
> > --- a/drivers/gpu/nova-core/falcon.rs
> > +++ b/drivers/gpu/nova-core/falcon.rs
> > @@ -20,6 +20,16 @@
> >  mod hal;
> >  pub(crate) mod sec2;
> >  
> > +macro_rules! impl_from_enum_to_u32 {
> > +    ($enum_type:ty) => {
> > +        impl From<$enum_type> for u32 {
> > +            fn from(value: $enum_type) -> Self {
> > +                value as u32
> > +            }
> > +        }
> > +    };
> > +}
> 
> We might need some equivalent in other modules as well in the future -
> do you think we should move it to the root of the driver, and explain
> its purpose with a comment?

Let's do that once we need it in other modules.

> I am also thinking that we might want to turn this into a derive macro
> in the future, similar to `FromPrimitive` - so maybe a TODO item is
> warranted for this. I haven't looked closely at the `FromPrimitive`
> patchset yet but it would be neat if we could leverage it somehow.

This sounds exactly like what IntoPrimitive does. So, yes, I can add a comment
to replace the macro with IntoPrimitive in the future.
