Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987B52F90C9
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704308; cv=none; b=LkgUG7HK+QoYfPnFiYPF0j5AexUdsk4H0avwrNkl6rzutUEELMf2FoSkPw24AE6NVoHA4Crtz456Qm7mbVk4PAba1A6nYXmtZNvMywz725rUYxYBv4+QPNyoJ4W87ssF7Ib1HdUDkcuf3NYwJVAgFRL3pSMpfr4RflLYVSJvyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704308; c=relaxed/simple;
	bh=ZfkP33VcqvWUNnVMxmueuVO7iCL5H6N3VM5f/NFItZo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MguMYQhUj5gAoTQMDcz8b6a80hXZLoT3Ij6EyYfzYFxCLvsczHGla86eCkFZQfpq6G5cbVGjEyWBmZcgnLe8LbBw4HW7OQYFbh9XzuG5SoszSzOqs26R4Pt14w0bIa0NJ8HJ/wjQOZPHNNpNHfnq/1v46cR4433YhxgB6t5QDJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YRySokJL; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YRySokJL"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2c8fb84fso3561795f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704305; x=1765309105; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HH0tVHLG3ca9kBOTOLq8pgJbAOcVBVaThO/dyel0SIk=;
        b=YRySokJLUThIPVm+gTfU9T8NE4n3c+XnKmUBCVj1A3HgLPFqRn1YK2GnYOqcBw2MfM
         /+EaxZQgZs4q9k7DRt78Y2ioCiRbbOWYVrI1iTJp2wT6rpQAGNvcwdXtY19sqeAM+zcf
         crODL9Brb3nNyqQTL7QtU7N6Nsw8Hbvt07RFpThR8mSpbEY9ulpfUH8vQGg5XG7bglFa
         H2mrSsM1SYIBoHUUDtqDL88CCPjP0+kNt3KNZyc2sU5JPX8pEg7bBocLztrQ39RJI6Fx
         itHLFzKXpnADEVCVPjnPt64Ncv+oKJ/IMx8JoHHh5cycIV4Y9RSOCo1HSt/YlVClxymc
         dGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704305; x=1765309105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HH0tVHLG3ca9kBOTOLq8pgJbAOcVBVaThO/dyel0SIk=;
        b=S8jrXgKH2RYRji2v3nsM/bpmv2TtB9E566obQzN+ghXWACw6a4LeJhmqdJH1S/sb4C
         eivl8fZaabp/+gzYKMWSYFMOQ+U0lM01P3Po5ut+p50kmIdIVasDaob0lIDgYzRPcqi8
         L6ymS5kkthEuAaD3mF2lPYnYT/94k3UHs9WnsS/POVoQ3PD1+c18ASsMddXvyq2FfZoC
         pzuIXsHCSNs+IdbaYUP+n2Q8XFQ2FaCNjxepACmvfxEF4SdVYJpsf7z3cGAff0PoLORn
         PO+YbDYQFjDXbk5hpPMq7Q/SxXjAqNyNEAMzpi99zhnN87IUm5xwtVTRlfKO3zDLRBGb
         iuUA==
X-Gm-Message-State: AOJu0YysNoL47X5Xv1Vxa8AVqtYBacpksN8Ju+LJCUgihg8UuwCoDMGA
	l9tIIGj774NKsKsCpdtSaC1svxlFgTss2R9XC6xblIDXfa4KPkWJMMWI+UlVEiZzdHLh4iJut+M
	1/B9WTbJwZPbfGY/gRscjW5h+pPz3Jo28GN1C0+2TxFEpRFOl2SnhmZKSs55VSzup6c+fjPwBlf
	pAEtSEAyAJtcz2NftiJoKfazOFm42hMIYqtATd2D2VbmodLvk4vZPMBgwGXcXCg28=
X-Google-Smtp-Source: AGHT+IGf/V7uMCrPGDznI1ahB6Qjky/a/3TGW12QgcKWncVdeiPUB9bmFpIWoqj96g3SR7EqCpOa/x+z2oqUhrE=
X-Received: from wrbdn6.prod.google.com ([2002:a05:6000:c06:b0:42b:2ced:aa88])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f85:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-42e0f34fa15mr34531491f8f.41.1764704305201;
 Tue, 02 Dec 2025 11:38:25 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:53 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ZfkP33VcqvWUNnVMxmueuVO7iCL5H6N3VM5f/NFItZo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AJwLCgR7mi0GsjPC1OLCINkJCKuI0xJ/WMJ
 wKkUshrxeqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACQAKCRAEWL7uWMY5
 RkQIEACx0wChzM7/WLtBFZYMdf+NlCmVZYNJtDxNf6q/dKCjt4O3ZcntsoScZYgpn6VCBrxe3Vd
 Gha703JoobNb4pQymxebJXzQnruwYEvAYYf7eoFVWkA0+2FD0EjcDL7lfjEv1XcXjGRM8CTxS+0
 2apvW0AmezBe3ecv3BTuLA1LrvdDiLVRlmehFar0twMSIaR8fkGorsuZhzbg2FFKFiImVs2OR49
 ln4zIHyj3E7NbEUvkMdgyE23heKlfE36mtoGWbaPoNmlaqP7fPQFUXB8AhxWWQCycvXlqJTJoCy
 8w6CuL1T0A6eqc8nttjZQvizHPIWD4Pyo0Gl6itMxHhPycw1y1afYEUp59h6+K44k1J71djL6z6
 quehTuVL8skx1J2X5zec6fFbyMCiBBOHv3h0I11IgSm5zCs9AerzHaa74UmFWa0N2QWdqjGb393
 VQUKmH1AqdnfUGOXqZGqnO3xiOlm+N+skoGyIIgrN3e1gLrM3a+q11QZquMwXZCVqvQiVwbsEps
 hazA/NAsJrfOfTJE29TFqXntaOTPsSp0Pg2EHpVB0H/NWd9WlXodLf0kiCcIdn24oy4qPjtcx8Q
 RACdWdkVJSPysrZ6tWlONK6KtUNj9/huNAHGgBOtmqjkum7CzwlezILWCprgV4nVqfKKwvH7mwu 6tGg1kGezOvl9AA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-29-a2e13cbc17a6@google.com>
Subject: [PATCH 29/46] rust: poll: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
---
 rust/helpers/poll.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/poll.c b/rust/helpers/poll.c
index 7e5b1751c2d526f2dd467fcd61dcf49294d3c20d..78b3839b50f065a7604dd80bc0fdbb5d8c50b430 100644
--- a/rust/helpers/poll.c
+++ b/rust/helpers/poll.c
@@ -3,8 +3,9 @@
 #include <linux/export.h>
 #include <linux/poll.h>
 
-void rust_helper_poll_wait(struct file *filp, wait_queue_head_t *wait_address,
-			   poll_table *p)
+__rust_helper void rust_helper_poll_wait(struct file *filp,
+					 wait_queue_head_t *wait_address,
+					 poll_table *p)
 {
 	poll_wait(filp, wait_address, p);
 }

-- 
2.52.0.158.g65b55ccf14-goog

