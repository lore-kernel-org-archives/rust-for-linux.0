Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4423184A
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Sep 2025 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757149541; cv=none; b=pmhufhKBUT+mz8duak20yiv3+GOrhlAYEfBnBlaPFt/MMReyjC91LbUdnyClAQk45icJ5g4OEkIppZ3Fi6PUQRoWL3QMSZLciBE56419CW484MAZgSKxGXqMz0ip4wCRyRhlecKYaolR9IARDsFGti2ytBs9mi5GMH2OldUJHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757149541; c=relaxed/simple;
	bh=3iQcrJcqfq++ZTQeqS1T6YrLPIp3lL5wLcHB28bWo/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRixxxbbdj/o69+kI2+V7PG9deBGzK1OwO3Vt1RGC5aS071PCxyhUTfkPaFTLKZW/e+IF4bnCqAAQoxHzFo2eRquOGnN+pABYaITXUblwIO65w1ktbCI8m3yzeJLxY4XS9XM3jLBRFyV4cwEPeH4L1tR4R6rB+JoRpSXiGm2kMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F2XEgIu9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F2XEgIu9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so1358480f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Sep 2025 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757149537; x=1757754337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hki8HdhvXHfU2F+7OeXOSp1xyhvTQ6nvom6Fvz3c+mw=;
        b=F2XEgIu9MzE/3fAFKvS77wTQGN9yWWe192O0RjSu+oLz+iEm2JKeatNUKOwCi9JAHl
         35JjnqLADAAt35gXBMNPk0BAHRMuRPyAiQD0LChmZHYyjYqoqq5f+FpLszNZEXl+o5gT
         /XtmvN/gu7eMjeWvB/T/JKOmaQY+HTK8tYB4IiDE1KghjIRZtVXOHsBZysfdLNV40dxc
         1eYYgUfHGBmUvCgL9qj196c4GxG+G9XBuhwwa2kJqritAdnt2scM3uGEL77W9ZTtXMCA
         Hy8JTKBXn0njjsCDXMtLC7n1L25uheu5GktVPv/GoacDP5N1JgtpSJk0oX6X/QurDWMS
         KuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757149537; x=1757754337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hki8HdhvXHfU2F+7OeXOSp1xyhvTQ6nvom6Fvz3c+mw=;
        b=m1AzypVRdgC4TsMVndav3yh2rkxFeG7TsQ78MXKQliTR6lvt7COKPzyjkXfUp2w5/P
         qGtKzHgfdoIYBTnc7U7FD1HjLBnTgX8YHrO8N6UG+Zgd6LavWHj/Un+Lo7fGpARXkCee
         8aEeuQbvCcONKQGPj8qG9ktqHT62+N3MxAJdZ6BvU6fzmQgAle7icLuSE99oC3wyOwsb
         fTmLGkkUOVbHoz/EbKMTnp2Cw6fvjhk+aX1Sj3VtW7Ww4fbd17SAvxquN3CzZKGzDlnt
         WSckW9OyKvHCCD8OQyM8OOFSHqB2/mrEZbfFso9I4w1Nq1XsvMPEut+4/LO7UYdMvTo9
         4pNg==
X-Forwarded-Encrypted: i=1; AJvYcCVFcDHrtdVVqSCsbFE8s6+YrmO2zWmOy6L+2bAT30O/49riYEtP6RFIZBJXcKdW9OJGEBt4PrdhTR9M5LM4yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQgcAHsAYw1LXPq3s+OVB4heFv8qrYGMYFTrlH9EnOCccly6p
	0pS10IUFTXQuqpojkyw7C0zF8s4iY9+jGsLSedbttq+ooFEEDmc3ucmwvewMFSIYgZ8=
X-Gm-Gg: ASbGncuFxBer/TDfEghe2znSW6Fgra3ZbxW0Qaxy3S3yL1W4Vq2ENsOJARSCJcJ/pzv
	IDPUhyLgfs4k/FQvHpu1GyKhr10mKcbwRgv2fzO+eH9nG8+xojAQSYNWo8qRD01AUL52XcF6QQH
	l+Fs7fAbmJYYQTI3TOK6tU5MjV4cTS/Rez4wk5ejRfHG1Rtozath82+c0aLrohWbRgor/R2uaK8
	plczjSynvd9Rp3sFW4zOTl5t0dXmW16cnQ7fGrr2CMOnoj0oN3ncAO/lEWITWhuVeuKzJ4MLIHZ
	YD8yhSlx/mKZBo9w3Wxn2OQH6BZezGd5sP7Br4LLpQIfeFJfkmHRyii89HbWLHiplHzVy1XHOwS
	BOOlx8aTuTvalPjAdGo9lwuBZOL1JSctQpEly+A==
X-Google-Smtp-Source: AGHT+IHOiFBNtbdh+ZPHcW0eh5OTeyAVCftx5e6W3o7t6l/2O0QB2mqkLdjfjU9NIQo/lpGZbryoNw==
X-Received: by 2002:a5d:588d:0:b0:3d6:4596:8a29 with SMTP id ffacd0b85a97d-3e643e0a48emr1185814f8f.44.1757149537170;
        Sat, 06 Sep 2025 02:05:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3df4fd372ccsm12287698f8f.32.2025.09.06.02.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 02:05:36 -0700 (PDT)
Date: Sat, 6 Sep 2025 12:05:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Carlos LLama <cmllamas@google.com>,
	Pekka Ristola <pekkarr@protonmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v15 0/5] rust: adds Bitmap API, ID pool and bindings
Message-ID: <aLv5Xce6R4ofalnf@stanley.mountain>
References: <20250904165015.3791895-1-bqe@google.com>
 <aLnURXW_ZiX2iJd_@yury>
 <CANiq72==48=69hYiDo1321pCzgn_n1_jg=ez5UYXX91c+g5JVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72==48=69hYiDo1321pCzgn_n1_jg=ez5UYXX91c+g5JVQ@mail.gmail.com>

Here is the patch so people who want to build linux-next can just apply
it instead of needing to cut and paste and then %s/    // or whatever...
Hopefully, people aren't building kernels over the weekend and it's fixed
on Monday.  But just in case.

regards,
dan carpenter

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index 6e0824579781..2f00e91e9c35 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -551,18 +551,21 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
         Ok(())
     }
 
-    #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
     #[test]
     fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+        #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
+        {
+            let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+
+            b.set_bit(2048);
+            b.set_bit_atomic(2048);
+            b.clear_bit(2048);
+            b.clear_bit_atomic(2048);
+            assert_eq!(None, b.next_bit(2048));
+            assert_eq!(None, b.next_zero_bit(2048));
+            assert_eq!(None, b.last_bit());

-        b.set_bit(2048);
-        b.set_bit_atomic(2048);
-        b.clear_bit(2048);
-        b.clear_bit_atomic(2048);
-        assert_eq!(None, b.next_bit(2048));
-        assert_eq!(None, b.next_zero_bit(2048));
-        assert_eq!(None, b.last_bit());
         Ok(())
     }

