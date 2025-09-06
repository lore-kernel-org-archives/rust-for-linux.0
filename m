Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49024261B60
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Sep 2025 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757150326; cv=none; b=LjFSqPxRonV4QWBOCmCAskjRcOUitWg5WPgUppORnY7s4E9RbaXCe1J9S01an/yEhl3nJNDoZXljsSVx6ZMNBmmRk7I4Y6l+fRCMkNSp+E/T7SudqkisPDCDc6YncrdMoKF/xDqtzL8Y3cn+va6zY4PHN8YnG3rdwfjp5v7dUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757150326; c=relaxed/simple;
	bh=ZQ7lpd1XT5N4T9SMoxnjuRbAVrF7J7a9ednn2KbopRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0Wjz2T6P8gY2TCQnPuydOsmYpy4STJhnQbOx41jymBPpVpzKiSsXwyEvhpoLF4NdtUhZ3rkTp5nbyBxbrbTNdt4RcPRCcMfvRD5a/RVSdxY1oTbLaqW9v+vpmBlR9G/Q1R7veUHUxdDtfvbQPvS9dclxA7QiWrtttvYFZUfZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWzTRbNJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWzTRbNJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so2502750f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Sep 2025 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757150322; x=1757755122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fAca1bJIuquQIcM0fzX3WTDih75xluTXBl9R1BvXLgg=;
        b=NWzTRbNJQGFdUqlR+wnuQnBNbeG0Igd6vr1GCkn9S+k6nVn2Fr34WemVB62OF4Jkcb
         1CU+BRojGfqpVvve+ABOeFbKsBemG9izn3lGmkYLFIsvxgkImZmq5ZISIouBNlCGnJsC
         NfoR8KnZBoPaaTkGO3Ek9P5DKyyeZ8xy1lxCkC/tO+EJkOs5mlNsT5hXPP5c/AheVFEb
         dDGWd1h2YcjL3QkP+WMDJ1z1/1IHyDir+xOLOM0Yf/xJcQOkDE+qifwHKyQtFhJPVvAG
         /c+oufGhlbuEqIkQd7D67WAK+v1YusPuGizqCklWuR7bgM6wHG03iWLjcHTxDz/48Zla
         w/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757150322; x=1757755122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAca1bJIuquQIcM0fzX3WTDih75xluTXBl9R1BvXLgg=;
        b=cuCRDbP+UzkBBzRnp1R7fX/ep70ceXN+sg1p7zeERUIuLURCYhLG+vwVklrtKIPhXt
         /SDu3DQ9j2nML3XxJuJeqxvTD+zCA7/9BYET0VQwtTR63BVhRXbHIay8JBfyvvXNnDSO
         ZlX4nhArliQBxObyG8I6zzubQzYU/Yhq10eyeCh1uow78PyKnfD9Gqtdur7gYLbf2Typ
         eEtEKavvODiH+xXPMdHafGqxy/Sh+e37ZqJ6y3SqM4SEkh4OjN2KOgzu5hpc6aO3CxzP
         2Fcq/Qr8fu+RRCXbaMtKgGeInV29Gt13H4AaBtqjH4vjPZjNFHntvtKT6J5EhmeIRIJL
         W7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcKYfQJQaoP91Heencf/Y6KhpiCcfYPme5dloDexPxo45cRlVvZ9Y0c1aWmrapPet1gwyql7TwkrQlllZR4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTzyrnZAnDuTxOxdkkO9i2nrSUz6Bi3vrSUjYwjbP96+RWfsn
	HYDM3jp9rEi/KmerUm+IY5QmpDUZbkvMRUb4T2kAyAwT8lEPtWJhxJSF1RamjnBL3Ow=
X-Gm-Gg: ASbGnctNQ4FlYp7XXX/V+qeUs3PMUSAFyiewr1uYWRmCU+aAYfTS4ZWpXUNt2UQpJYz
	jJj2nOMBooAAUafg6LqBoB+nvD6v8FZdMCx0z0mecmbpRZfwFR9d1heEkNXpUo+plFB/gzvw9o/
	dg3TgJJtph8GjY4RmV2p+X3q82senHmKlTRAeyhe/uTU9OrVNA8N1QwBcDpb9xsvP52PjPJsxmp
	7KPy0L1+s+EnFr5VFH/sUqZB8kJm8J2RdQqIEVTstx4WSnerq7e7eWBTH1YinbeAlJRiPtJ8ANw
	SNzdmHO44zpcjRTGfCqpuMB76L8SjDOORx7zzpn3y62+mWRkVoHkSPtnUq9ANbGQDvkF2HwJGaK
	2I19VydHps78kFedshjQrx0tKU47X39ZvV527CA==
X-Google-Smtp-Source: AGHT+IFqp1h9ELb+FvrQR7wCwtJrfM0BwFm8jLXPTni+jjcYpKHWVl8UfYcV4E9Yyt0+EtOgeMcByg==
X-Received: by 2002:a05:6000:24c8:b0:3df:1a8b:ff60 with SMTP id ffacd0b85a97d-3e305777eabmr4744914f8f.23.1757150322499;
        Sat, 06 Sep 2025 02:18:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45de18f4824sm2997995e9.10.2025.09.06.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 02:18:42 -0700 (PDT)
Date: Sat, 6 Sep 2025 12:18:38 +0300
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
Message-ID: <aLv8buzrro0E5CCQ@stanley.mountain>
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

Nope.  Try again.

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
+        }
 
-        b.set_bit(2048);
-        b.set_bit_atomic(2048);
-        b.clear_bit(2048);
-        b.clear_bit_atomic(2048);
-        assert_eq!(None, b.next_bit(2048));
-        assert_eq!(None, b.next_zero_bit(2048));
-        assert_eq!(None, b.last_bit());
         Ok(())
     }
