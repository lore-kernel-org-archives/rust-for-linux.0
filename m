Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DBB1FA272
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219160; cv=none; b=WxIYEIIDPE5d7//o99qCWHBiCewVVg3nQW3NXql3H4QR8bIjd05qsibyWFciBLlIHz0j4sEvhThJ4eELEgd5dpTgr7ez4ZjsERiMO0IKw9rMe9/Bkt9vHUVYWfNbTp1D5hf+1QHAY1MAZiJfZWU6NgiUUpjLgA9XW4Y6QhmthHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219160; c=relaxed/simple;
	bh=azN9cFPaIK+LJvezpMi4n8W0xzLhUdTsw6rk/82Y4Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUh6U5s++wiKb2uuZua3QZzC6uv+g6f1Ec7y2P+WWjTJDIqYcy8agGyX6ACw2EkOCCfk3QMi32NA5MOqN0IVYs9eGqcX0v00SCWqzlIb3hlcYn0aQVktEEoisUyIVTM4DpcFFyiUutyYllT2o+S6X98O5V7aGxpdhBkL9gPzOwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzjIwAqF; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzjIwAqF"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so946521a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 04:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761219158; x=1761823958; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QbT+vL0Cn4CTb6yElLpwHZ54WgDRlKCx3aWeBMwUJrQ=;
        b=GzjIwAqFeZ4Us1IkLeYKFX/B9rnMtdcwRA3Z7JWlL1EeRxoTIPVbXGclFmtVkpycPY
         pEyXmgDZuzqaCmnlV7kzyOoRSlMV+4sKlRsdP9M7W6EtBbVoyD4VtoA48E5+EB+Mmo5M
         +rPeLnkCrh8ua9Vrk7+U3o8pxLOxATEtFFdA3YUC2ngtWANcdBbhG53LtbEbu4WnjrR3
         8if8sTwBEOHGJzAZ/aEdThe1U6V2FpJS5HPA3gk1GDjliGqQFXpHezuS76IoxX0TyJyT
         LQZQ/YcCGpNBxop0WV+RdxVXJZJ5XAmfSKSs8cU/oLzgoea+Vg8S0DImMmP+GeRoDGDf
         9NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219158; x=1761823958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbT+vL0Cn4CTb6yElLpwHZ54WgDRlKCx3aWeBMwUJrQ=;
        b=CHkhlbQhAfMSFDQd08WZObniTuJw6kXxPtw/FB5JN/utjyvXqJRA0GG3XfM0vwF+JQ
         EMBOVfB6qZGb0+reKXZFpspzc2keqb1ohqUVW365mruJ1oXvNfXT190p2egzrx7r1wFZ
         S/iokjohke6M3Z1SHjPYLTp7AfEMi/Yrzx0mz5SPT/tTpwvsLMvcPfNquwYcB6DRA76e
         D1dgFR2CRQcSYo54aoEGVX01T7Ys49Xgf2mVlbL/Bq/iaxlaCpP5imGi/pZxQwXZNEgg
         kyxg19o7XLx4eIYp/6sq/+OinUR6eQ4Xxbsoudexr4kV0gi6kOQHDBK3pqJcmifsmyN4
         mebA==
X-Forwarded-Encrypted: i=1; AJvYcCWXKIKmCOt+ZbzH2anXRcvKuVrVc7EhuD4MK0s+gkyQE++BDwjXtrW0iI6FpERHKOWdI+ofa2OK4elhhp0BLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdMygeIx2ttpcg8gpwv+8KvgkYUqAI+v41YbCWGc20UFV80g8
	2KSNAhK92voBrAEz/9+/i5S77rv2ghyK0u654nLuem0L7naNr3YI7bDuwqzzcBvW0NQ=
X-Gm-Gg: ASbGncuavu/kWJcaazEmFqnaQ1XI6/DTaJDw5WjCwQQn7ibizY+N5ez1z2BtNWD2UvA
	HtwUZ1BUIhPnRgplZENfw39GllSncyPiNd4riG8IIQG4tiwDwL1HH4jVaJnLLppKgSNs08qi+bz
	2DJ+5Ob5D5SUuL1ifxRiYJLz/PBPOfD0NdNahl4KJ+yxpsVyqfP6IllbferYp1Gferr05oZf1GB
	SV7jt6lthF+gnBC/0HAoUCH4rKcr4cYVuEO0+M6nix+zjVP1q5MiB3EQRfkv0XtchCuilgydXbk
	ePIoRRM6I2qSYobwLd9CXToYviR+nhHIB8Nr8fn3Td47HpxnWRH60gSF6j/p+tje6xC/hpT+4K6
	ZvHcAMRayVodmKHLjeaDqXgOSQBPNuGe6djvDdm3p90ItCt659NC7Bd94EHi/+j2qIACa3/045E
	Vryg==
X-Google-Smtp-Source: AGHT+IG9Mwz3D5ODuzsbIDuuLt6IzRd6uufkDmvzSlsw4AlqElvO+VEf4ssfLY/szdToC/ms2IV8tg==
X-Received: by 2002:a17:90b:4c05:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-33bcf84e181mr35547160a91.6.1761219158271;
        Thu, 23 Oct 2025 04:32:38 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3c1f8csm4042462a91.4.2025.10.23.04.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:37 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:02:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: opp: simplify callers of `to_c_str_array`
Message-ID: <44k7h2wzksrp4eghvdim5kiq5tsul3p7yhy44d3eii7hyvivch@xx3x762acknd>
References: <20251020-opp-simpler-code-v1-1-04f7f447712f@kernel.org>
 <ms55ue7qqbvoyfhptzu2a5cuthusihtobremhuqfm7lyu7b62o@qasunalgkptl>
 <CAJ-ks9mKiXR-8m_9x_k6YcL64h+QWExkiWCHMFNJbdUYQvPsNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9mKiXR-8m_9x_k6YcL64h+QWExkiWCHMFNJbdUYQvPsNA@mail.gmail.com>

On 22-10-25, 07:22, Tamir Duberstein wrote:
> I believe the `{clk,regulator}_names` vector bindings remain alive for
> the whole scope, even if they are shadowed. See
> https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=800b334c514c2024d7b5e47fc54c1f2d.

I tried to print the name of the regulator and clk in the C code:

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index d67d392e16d4..89b65fe07b99 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2565,6 +2565,8 @@ int dev_pm_opp_set_config(struct device *dev, struct dev_pm_opp_config *config)
                goto err;
        }

+       pr_info("%s: %d: %s: %s\n", __func__, __LINE__, config->clk_names[0], config->regulator_names[0]);

and I get this:

[    2.358437] core: dev_pm_opp_set_config: 2568: �<��y����<��y���x��: �<��y����<��y���x��



With following diff applied over your patch, it works again:

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 743080e14292..02cb754c4abd 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -444,13 +444,13 @@ pub fn set_supported_hw(mut self, hw: KVec<u32>) -> Result<Self> {
     /// The returned [`ConfigToken`] will remove the configuration when dropped.
     pub fn set(self, dev: &Device) -> Result<ConfigToken> {
         let clk_names = self.clk_names.as_deref().map(to_c_str_array).transpose()?;
-        let clk_names = clk_names.map_or(ptr::null(), |c| c.as_ptr());
+        let clk_names = clk_names.as_ref().map_or(ptr::null(), |c| c.as_ptr());
         let regulator_names = self
             .regulator_names
             .as_deref()
             .map(to_c_str_array)
             .transpose()?;
-        let regulator_names = regulator_names.map_or(ptr::null(), |c| c.as_ptr());
+        let regulator_names = regulator_names.as_ref().map_or(ptr::null(), |c| c.as_ptr());

         let prop_name = self
             .prop_name


and I get:

[    2.460149] core: dev_pm_opp_set_config: 2568: dummy_clk: dummy_reg

-- 
viresh
