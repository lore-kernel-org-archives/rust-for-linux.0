Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91366384238
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Sep 2026 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788647129; cv=none; b=PDL268UvzA/f2D87lchbIWZs4fb/7sDJ8c0utJjhUkdEJY6rWbsMZZXuwe7JGhjGSOlRyJhDbAZp1V9F3yaGRBvH+9dk5gmr3cE6y9h1p1DTbXtJxVQ8l/iev5Mkc3CA24e4oNBFrzP0Qwn3JXGlZmmVC+OgNMN6VRW4hiHNYeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788647129; c=relaxed/simple;
	bh=ngl+xzOiaCR8FkeiD4BZS6Ct3WMCnpj/FpxmjdQvCcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrI1jS/q1qD0gaKQw94+tYp+yV2cTm5hR3nOEGtLlINVTuzn73WfYOMXcA+/zbkflx369kkSrTcjdeh4jKl42kEdmeTxwtjQS/HibFza08B2LrG4EQ5F1ZS176BLDQ9ZuPoji0fvGfsSfzOGE5yrElBVaPQUV/6RZ6TbUTl1nE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yko1n5Vv; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yko1n5Vv"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b6036e9c70so1796120e87.1
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788647125; x=1789251925; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=up7v4iXfsfw0NZXjJnHOv6nLKWdrBroAhEtbXWzurTc=;
        b=Yko1n5Vv/Tc2A8zdvPoBbgp6SM8eBEIkWYOuDzAz4fSY67/fu392y7t5MA6R1EKGNF
         SK+FwkqXQUY9AVomM4tlte/H3OIWCPIIzU1UIcKgKqVBMnkqTT6ZvHbJ66T4bKcg6HO2
         0G+gTtr9X/39aTY9oErNXoqw/AVrX0c1K1YG1c+8wZH3Si0bZHhvA6TUb5VAMZq1CRsd
         QsgbhgJ+U7n+TD4ayL5W2+I062w5aoIaZ5SA/PB2fNNa91csnCdlMnzZ6C9bTOmg/Tno
         2L7P7VG5ybCWRDa81o46+WzLzOTx/WwJI0rNHxUOplNjZ6hBdjo9h2+FXRmXMGWvEQTs
         7TNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788647125; x=1789251925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=up7v4iXfsfw0NZXjJnHOv6nLKWdrBroAhEtbXWzurTc=;
        b=jAwXrrRwrD5BtNCpJ83vwDFea1c/VAL2HdFnB+smhDYEWfMVOFQpWIaGQevVgDn39J
         WYbYSgQv8y7Q4SXUqJvHJLa6k4eYFU5HIoDAfc/9jrIhi7L9Fb39b+wVNXeBb/y79yQ3
         Nm/e/eDKIzrbEO8HcYa2lV9up0QGXMWitwnrUnkctyLpprRn6Wg/dN05nf4Koi9XkIAd
         I1JazQwDHl0NQTxRF7YpCzWQDemehzikjOs+FJsQ0uGmXqQ2o1BpL0/7ECOr/Gb/Crdi
         WmykYyTE0QrGoXZCI6SEXkv8vgg6o634s4gyyw3xE2hxsNDu1zTQoy6XJdbmzLJhpEny
         leBw==
X-Forwarded-Encrypted: i=1; AKwUvBwlSITuz71UC0Q7jH7SP3eQDtdB6g0AygsDJhiSKsYRVpOWLuOLtHmZgpwoyFO4RB6VcIsDpehELN2CGgroxQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l+xtfCbWL3JCXO6CewB3Y+Jn67sDQLPU9n9fEcBbeFiv5bglMF
	jvBQyfozocxuR0UI4n8LyjH8V6RsmNPxihEhZM9yG60m9bWy7avi52q1
X-Gm-Gg: AYBFou0nKwVU4gUe+qEH0HTrI+IPWMhKeVS21Gta1xSu9fdUxq9dv+xRUJLh8k5i71D
	4CLN+l9vJUwPCi5YY7lyaI/s24zddkDzkosniB2IYkoVtuQ47BSc1VeKqYwMrNv8epGZnp7VTAr
	ry7RoSzTzljZ/+69zXz0CNfglsTvNWOI9iZ4BE/v8JUzoxg+slY3oMqdL3k62H+gN8RBx6dLXGm
	EttmZADyLU0jrNQ877NtloR46z+UU+fA2Kup0F+VWz7S3cDnHB0aBMG6ZKPPQSAn8AXAdpaDSWv
	7s34+iNcEqZMlFQ5tAeyWH2RSKO9YkQqzbHgXDpF0id0NuduB9/+aqXOwGmZkT6DiXK+Jj2ifGa
	HcOlCJBY4fd6u/It8cOPrDCO+h61TFUNJCHRW7OnIG1+BpSkIVAEbOx5Nr5oiTdFNscEg9Ln5d5
	Y7l+8O/EVdbwctAyq8413iJLsuLsIk1K7dx8ituio+mVr3lzjJFspwn+9ag0GIPf4RItfRzsxZl
	+4m
X-Received: by 2002:a05:6512:3503:b0:5b5:e8d5:7fff with SMTP id 2adb3069b0e04-5b616f0ba95mr2232510e87.8.1788647125226;
        Sat, 05 Sep 2026 15:25:25 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166f6c00sm1299495e87.35.2026.09.05.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:25:24 -0700 (PDT)
Date: Sun, 6 Sep 2026 00:25:24 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Felix.Kuehling@amd.com, Mukul Joshi <mukul.joshi@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/gem: Add callback for when handle count goes to 0
Message-ID: <apyTR-f8W6Jt7uP5@soda.int.kasm.eu>
References: <20260831183311.1090131-1-alexander.deucher@amd.com>
 <20260831183311.1090131-2-alexander.deucher@amd.com>
 <aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info>
 <e8a53eb241b2cc912e9cfad5f6a0120aa9683481.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8a53eb241b2cc912e9cfad5f6a0120aa9683481.camel@mailbox.org>

On 2026-09-05 11:31:41 +0200, Manuel Ebner wrote:
> On Sat, 2026-09-05 at 07:36 +0200, Thorsten Leemhuis wrote:
> > On 8/31/26 20:33, Alex Deucher wrote:
> > > From: Mukul Joshi <mukul.joshi@amd.com>
> > > ...
> > ...
> > 
> > > > error[E0063]: missing field `handle_free` in initializer of `drm_gem_object_funcs`
> > > >    --> rust/kernel/drm/gem/mod.rs:265:58
> > > >     |
> > > > 265 |     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> > > >     |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`
> > > > 
> > > > error: aborting due to 1 previous error
> > > > 
> > > > For more information about this error, try `rustc --explain E0063`.
> > > > make[2]: *** [rust/Makefile:799: rust/kernel.o] Error 1
> > > > make[1]: *** [/builddir/build/BUILD/kernel-7.3.0-build/kernel-next-20260904/linux-7.3.0-0.0.next.20260904.221.vanilla.fc43.aarch64/Makefile:1442: prepare] Error 2
> > > > make: *** [Makefile:256: __sub-make] Error 2
> > """
> > Full log:
> > https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-43-aarch64/10951622-next-next-all/builder-live.log.gz
> > 
> > Reverting this change and 2/3 from this set fixed the problem for me.

That leaves only the documentation without the feature so might as well
drop 3/3 too in that case?

Otherwise, the following also fixes it for me:

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index e1ebad77ebe2..847e0ee38863 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -278,6 +278,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
         vm_ops: core::ptr::null_mut(),
         evict: None,
         rss: None,
+        handle_free: None,
     };
 
     /// Returns the `Device` that owns this GEM object.

> 
> Verified.
> 
> Thanks
>  Manuel
> > 
> > Ciao, Thorsten
> > > ...

Regards,
Klara Modin
