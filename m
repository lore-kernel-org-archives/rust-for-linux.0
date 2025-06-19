Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDF72417E0
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320967; cv=none; b=TtYjQ4MvTdoXfRZUX5/5/b7Cg/8lxdw8Jgwo8yGmpgIPX/AfqaFaTsF2Bru7XTbJmRcDIwUrVkoqfHUXBHgbw7zOmcw8PvXgs3aikYCWL0WJKS9fXj8TDI4ehxSbIXMMLZzCjJ7j28Fi5RMAXCnCteGjAVLOoTzcwnqAOkNuQJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320967; c=relaxed/simple;
	bh=zbCaHIDni1is8/1VUzP5in34Xsb1zCdrBhY2rcfVogM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miAX2T89D2fudgnwBPH5d5YwcY+lShYbIo5DHWAiWZGdO+aiGYPkrwVuiY6uw+Blh5Y5Ikun/7ih9+5BId2fnsm5AwhMIu8AbSO0RjBWR1VxJqY6ogQvkBGmyjQyK1XutupBjbgKzP53tknHWApYquha6yf2rBE5/XCxPQArFWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQsG0xbj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQsG0xbj"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2349f096605so8226305ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 01:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750320964; x=1750925764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0QlyepxER9o+isFGhwtQG1hSRbSpj4GjpamIkQZ6oo=;
        b=qQsG0xbjn3QQjdKCT6K4nV5hSKDGkVVfOVAlZXb+BZmsHZkxUJb0hSMauTp9X9yAFj
         tI5HpZA3l2xoYCOWyOebCUcHUdeQ1QbCG/o31/qBTVqPQSVerGuxP10z010M+IHY2vGM
         kK438Sj9uBUAYFW0g17ZLSuNwtZeeBThCQ2xUU+qEeNs2+9FVnFU7StpQO+cDKZRJ70+
         +osnwZvUoPy/eMs9f2KAft8sX4G791n6AtFovKHTdh9YwaAjFpBF7FflFlXU7BbKu0Pp
         7FVzarF7RAH9M0lEv1WfPnUEqCf3A2HrEIyVuHb34j0wrZJM+oUoaGEAD/uAidf7EE+G
         +5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320964; x=1750925764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0QlyepxER9o+isFGhwtQG1hSRbSpj4GjpamIkQZ6oo=;
        b=RzKU16/7j0dOBEPh741wg6lEXOEIT6BL5twZ2vejosZ1jq5tF1G3i6Hm1D+522X3hR
         HMSrBvywlPKCGL5njRmGoRGrR2+MMEvQIIiHveBzVtP0P3xKAO3EmF8z9si5qBt6b2NU
         gEusL6MmgA1FUQSXFJdasZIvslFAeigw8b4oK6FdcXFJkG5Bq1ztvYWimiGrBNe9Q0/X
         VQ8lqGQ3ADhOsQHkv2nNAH3fi4CHtN9rp90Yy/esQPBZFKGPhnUSV2vIis8dm9HgCvOy
         Tn0LBTcGbF08xwZdTX+GmnmySaE0Jmbm28Q/Ec7TLudQKVM8Q2oOtOraMxgsE7CbL192
         QgFA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3T9Q6D9PO6nr1blZ5QzuPM5q4JGsLQGEXx1QzQxAGlOlGwIdLTEO/7Do0qDsyjWoSnYZ3g2PW+9sYkfpLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6xptcuO9L8Dyl/xQ4TMStGTbOzPI5kOkCK22x04qarCy+/bx
	o2Fjf3HPuBZVRD9jDFkKj9J0gRFhmQKre3YWMa4d7sMSeFPyYuCLPVVhG9AAYdUzXqQ=
X-Gm-Gg: ASbGncsq5XPBdoY6TNPQLQNXnY/UaBBKF/aVCe1egZBgyUdYPRE/yTej6+IgL6W+TMm
	CZ7z2QfHpmcq1c5pcwJRf4z1b8JfIEqgwRaONn+njJK1esTaGASft3XFl+Mxb75ZaYmEyvbVCnW
	ePH7v2/bPzCIy/vFu9r66HRf8UGFs+t2/zmFXUJYMy4i/nlm3k1F92gHb51YBstss8LVpCciQTi
	UMkf3u8jA1G1mCmLs27pxLsgEDsRlXpxs5957SMDDcF2u6h9BlxICEGDB2ISE/B1faBZCU13fd+
	VUhfMNjN2PtsXwVDI33bkdAUuo+eQh7lwbT/mnGN/C15E4Rsb1vIZ/eL60KNtvs=
X-Google-Smtp-Source: AGHT+IEawLEh5ih0nom5h84EhiR42/JMCNTCVEdgMiTCqrC/LqbAHFqUFmpjyl3R9tYM3sjCCxQHtw==
X-Received: by 2002:a17:902:ce0f:b0:234:986c:66d5 with SMTP id d9443c01a7336-2366b3137b5mr354396845ad.5.1750320964113;
        Thu, 19 Jun 2025 01:16:04 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a4d6csm114635095ad.88.2025.06.19.01.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:16:03 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:46:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: cpufreq: Ensure C ABI compatibility in all
 unsafe
Message-ID: <20250619081601.yeulh36lhrqxo4ep@vireshk-i7>
References: <20250613101815.18092-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613101815.18092-1-abhinav.ogl@gmail.com>

On 13-06-25, 15:48, Abhinav Ananthu wrote:
> Update all `unsafe extern "C"` callback functions in the cpufreq module to
> use `kernel::ffi` types (`c_int`, `c_uint`, etc.) instead of Rust-native
> types like `i32`, `u32`, or `usize`.
> 
> This change ensures that all Rust callbacks have signatures that are
> ABI-compatible with their corresponding C counterparts, which is critical
> for FFI correctness and safety.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1170
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> ---
>  rust/kernel/cpufreq.rs | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied. Thanks.

There are few users of kernel::ffi::* in cpufreq.rs and opp.rs, if you want to
convert them as well.

-- 
viresh
