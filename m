Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91252ED860
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704289; cv=none; b=Nku2kpWx2yJ8a0IceepEFXvsZPqGCaVUieLeeeR9f5wsvcKOn1ZWoG8dYncOkgpkaAHYiY5aZnyMX7rh6l5BRVAV30k3d9xyfaBlHhtgYA72qKktI5JFVDRufl3Ca2gTV4Iscx15JjTtq29lNI0yVsEWyW7oOt5fBTEV2B929Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704289; c=relaxed/simple;
	bh=6o+KPJwvLA0f4xSzame58UmeK7zLXVerAQzULdZX0iQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A3iX23Si9QBRn3oXC8TskAsjSukp83dbeIAL9vEaZPk+5T8nrXwM89mw1SsL/yNinxULcA2j2hSgwuA67gyRb7Cnn216ySnp1RJvb/efRY1gFQp/nuzzRFzgyEXVvThKCF6V9VCCWhqnuSluPEcUeKnJjUY+5ejssItDndf9r0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AWLhmQj7; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AWLhmQj7"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64160e4d78eso5623785a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704286; x=1765309086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QNiGalR8PRJw0q0ZxlbmFuTXo7JoG4iowPqULhb2i2I=;
        b=AWLhmQj7UvmiWayWxwBPuVLh5KlVJDYKPJFwME23Fv2i2k5eDwYGkugA25qZkU+oIR
         8nTwoXS06SdKaHTQx4jKfFkS6xa1GfZbHPoEZAlbmsbXzk+6Cd+WCydbMWAGJxgvFf0p
         n6r/wyDg7UMe380oqhO3b4S+nmzzb4TcR17Ch/4xF99SydlyHlolfj5L1hx6GTA6lg0X
         pdkw5/alGRH7is+nGLHwRPiYud8gNW5rVdQEdiu08cAQCIO4dm40w0STtGoSHO2bz2uV
         pWJeNeiQ2T9HrYSc344N1hn3Wnak8DnCurCRr6mjWdHS3wF+On94emgh/oiVHd4xK01v
         4u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704286; x=1765309086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNiGalR8PRJw0q0ZxlbmFuTXo7JoG4iowPqULhb2i2I=;
        b=ir0oGwzo8ac3mCHURtwC6RfkpUqc1sPpEYQcFiUbrS+qhb06ZknC4H6GBpGfSQ9Yc8
         uHk2SOZ+EwFXhxLnEDnB8ZS1aGQqis71mDgAxjhR2usprwWSM/TG4rndnu2oEPf/Vxxe
         yUuNEhf9R9VaVW03S0fbaqH60xESs+oUQMDOTTeKW8PVsNjIPLDeoPiUzakWPv1TDMHO
         PavL6mlxYKjImrncJz6YM638+slCdGi9Ulx79KGhPH6Qa/mfr9uwn6GcSjg6pKhswrcE
         RCjgMxqvyMg5bA/yRDF21RunRV411L1GwYYdT4cue7tynT6GDKCeqZe/h0WVfkiheAc0
         1NAw==
X-Gm-Message-State: AOJu0YymEhbM/aFLiwZgEsT2vEw6zfJAt9PjZf3WQA/G6f8nQQxsJeY2
	tSSq9mNaqOgqZyY5MVLSajeAFGvGMUz2W41Zy3pIIp+XGPsqkkuzkYf2m31gstEQ0H0HzzguNQK
	ZBQvqeBodtM6aFp7hpf9CRLZIHxKkCG/f1wmaZfm/LoOS56TrMjMQjBJZYzi7SPs6C74k/PSXmm
	5y1A9rZohGgXDmaBLkFZt212FqrXlAyLT14vGriok8vntY3hKMkTQYMF5BhXaNTOw=
X-Google-Smtp-Source: AGHT+IE0ILkNPVdyrVmO92dSHLhcoGslYLKF+h6AF05KDtYZQI9z6dkVQHUEc+HhJZYYv0yPFV6PibzDsGMAoiU=
X-Received: from ejcwb14.prod.google.com ([2002:a17:907:d50e:b0:b73:8f8c:46e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d90:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b76c54090f0mr3291644266b.25.1764704286208;
 Tue, 02 Dec 2025 11:38:06 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:38 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6o+KPJwvLA0f4xSzame58UmeK7zLXVerAQzULdZX0iQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AINPJX3ixKRZTFjg3g84AsOgJ/DVeWSUYne
 IO7p3gHePyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACAAKCRAEWL7uWMY5
 RgawEACuX90QL0ENvwBDQCrVd5NibcFC4X1e/Vc8qahUypQecczAEEExh3Si6xhU/F582w12ybE
 BsuQm084XmYBhOCP7NxzoxBrW6pWlFvlLfzjjTYboGCUhQBl75e7tSzEkYB7UqUz+4F9ncdHjXN
 lPGULZOVz+PVyGeit81LFaVHmWZuYV0P3kN2KJIH7WAMOn/f1BuIjzwS1CujVJnZA0qeuGjdVE2
 vp6EvWde/u5fI2/4byycOLoHHZv5DIkRBj4qODCu0kHrnLv7+rrNI4+07eJD1idWPwpNMHnTSxE
 mp0wjTGn4onM4uQkaBonqch36Fyxl/r6Ob9ExcsNf1LwhKzyDOjsXI9qxjzZDBJpcNgS7ZrTsH0
 7JsPQsEeD2GqDWvQ2dVKUbvssAcmXfCSxuYWl6YeeaUfqT7D+KQxX3+hpGp1DYNpPHWrisoo7kz
 EMHWB9/xK5iMVJSbUcYZrxfjHCikytaIJrMs3nOOwhPIbHpHa8Gk2KAzozu0B+JZouE2OA06zpE
 4IBjut2NvRWGNRBCAUUnGBYfbWIG49ElelncukuES25UVrV9vTuD7t1POhJy0vTOkLKeHkLlGKT
 rC58jRVxVGZG5IJ0utJ6mIbFiFXf1UkoG6PNGcYLeshKobIVPtIQZBuCT1FjassIcY6DzGgB7Kl yS7PYFkDiSCnKEg==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-14-a2e13cbc17a6@google.com>
Subject: [PATCH 14/46] rust: device: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Benno Lossin <lossin@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/helpers/device.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index 9a4316bafedfbc4015446ce1945f1bf1ae7face1..a8ab931a9bd1233c613a9127fbb3a93a3bab7951 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -2,26 +2,26 @@
 
 #include <linux/device.h>
 
-int rust_helper_devm_add_action(struct device *dev,
-				void (*action)(void *),
-				void *data)
+__rust_helper int rust_helper_devm_add_action(struct device *dev,
+					      void (*action)(void *),
+					      void *data)
 {
 	return devm_add_action(dev, action, data);
 }
 
-int rust_helper_devm_add_action_or_reset(struct device *dev,
-					 void (*action)(void *),
-					 void *data)
+__rust_helper int rust_helper_devm_add_action_or_reset(struct device *dev,
+						       void (*action)(void *),
+						       void *data)
 {
 	return devm_add_action_or_reset(dev, action, data);
 }
 
-void *rust_helper_dev_get_drvdata(const struct device *dev)
+__rust_helper void *rust_helper_dev_get_drvdata(const struct device *dev)
 {
 	return dev_get_drvdata(dev);
 }
 
-void rust_helper_dev_set_drvdata(struct device *dev, void *data)
+__rust_helper void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }

-- 
2.52.0.158.g65b55ccf14-goog

