Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66C165F16
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829999; cv=none; b=Hb/03MzQQGIQbds8jGGzQB+YBgwx56Gf3zsNo2haByC6I6FPiVAkqsZdQuKwcqoUgfUrxU1qexrBwyrTmyR3LNd8PGQeGbC6Qzax6DeMPLkaJMKnip7YX2OPJXWcwCDwhCBQE80/5lgWjhAm3NRnQ0qMjnGpNvDCA9zhnQV6GKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829999; c=relaxed/simple;
	bh=YJ4l8YO6+oXjEOidGVwHWzcVddJ2TcaRCjmIlq6mC5k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ew0q0D62duRur+xL+N2IE3cL4V0OzuD7Z6vN4OI7s3WyJ253kL/yCVjyEgXdLLzecCvWN1EACAms58g+U6LzIEdNN1bS8poeVP7+cIwO27t6LFk1bl1NQV6U39PqEj2741OaxmXusIfT9yFeOrDiUZzLew2IiEtZoB2uvVbqtKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=STy3dpPl; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="STy3dpPl"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3efa77de998so3576383f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759829996; x=1760434796; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FmSwAXOxZKUOz9AOH50gpoq+A3qgk8C+jOU4GTuqrho=;
        b=STy3dpPl9Xhi3iu2LiXEkKDT2Eoont7dMyNDlsZvNuKxu7ToXtBaEy68Sib4111Dsu
         Sb9WepWNzuhRM1zIhM7kO8AlsZDSTBNp4VD1+sNcdGkyAgFHfLlDj6vPg9DBijshI5+t
         cYXBZnoshkgpXj3KG5EZvSXswbdLzvzNbPWQa20kagefQKP2D+GQJJh+Ci4ToOnItVSY
         g3HTZFGCtUdWt9a4SYZuFASc2ZnU0Y32jIeOlc1RB2AKprVswT8f1tlpiABUSOkF4fPi
         lXCHwsr/OgHkxZo19p6lMj9OzhWcYDyOM8C9VDyxSXtsHSOtZZJ/TZVxoFDAfNuzcxzY
         i6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829996; x=1760434796;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmSwAXOxZKUOz9AOH50gpoq+A3qgk8C+jOU4GTuqrho=;
        b=I80VgZ5kD02pQBd425QZTRz4DNWDOCOur6RbhIfK3cIlXR5sR66OYAF8aGNSik3UfR
         e13OtInGMpBLAVysOFCdsS1c55I3MCLFnrapU6DdM3CHsLfBJMxwX1YQUw5EPQJ3b1U8
         mDtncz7C+7EvSPbfPaQTgTdo1iqRZD1UMrumV+OOZuE2KHL5B3bUZzFdWVDalSkUz89Z
         U0I77l0uHPX/okC/NKTnYPsyY99UnEFny0xTuJqeJkB6tDRCOOIR0ErBpF04giEl2U2P
         SPir1Z8Yri8LeokaUYEBes5O/F87TxcovsMRLhB5oo+lUMgFM73IqmJWNZBjltJG0/6Z
         KOew==
X-Forwarded-Encrypted: i=1; AJvYcCVF54gK0l9PRvO1UKd3RJZr2zaHyzhj2jehRuTdIf5pdor0SEQo9VNuiaPNrF/EYsckMidEKXWqneIvVUyHhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCziOOze0P6x5xN8z56ZzNJ9TZERencWvryLxpiv0zL1DPk4/x
	rMSOxSReMMcQZjTFITX40qpbc8Z/xKZpwIYaPA8y5mjuBsncc9nHAlP8kvPQGO2dLBALO0Nfaa4
	NWLWh6gDVENmUN63Wrg==
X-Google-Smtp-Source: AGHT+IH9mV4n0lSExlu3FWYpv4Mx9IbTkfdC7gum/bBTbtYumGPaxNtiTvGoi4bA+x/MdMJOo0Dus7tFTRbpL7M=
X-Received: from wruv15.prod.google.com ([2002:a5d:678f:0:b0:3de:7346:de21])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f47:0:b0:415:7a6c:6a38 with SMTP id ffacd0b85a97d-425671c3bcdmr9683097f8f.59.1759829996366;
 Tue, 07 Oct 2025 02:39:56 -0700 (PDT)
Date: Tue, 07 Oct 2025 09:39:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAObf5GgC/13MQQrCMBCF4auUWRtJ00qJK+8hXZhkJh3QRBIJa
 sndjQU3Lv8H71shY2LMcOxWSFg4cwwt1K4Du1yCR8GuNSipDr2UShgODpOghPhGQVqjGpwdJ0P QPveExM/NO8+tF86PmF4bX/rv+pPGP6n0QgoymqyzpMw0nHyM/op7G28w11o/IQg1NKsAAAA=
X-Change-Id: 20251002-binder-freeze-f99e23dc47bf
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=892; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=YJ4l8YO6+oXjEOidGVwHWzcVddJ2TcaRCjmIlq6mC5k=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo5N/qX3xFHhbOaJLoreqfLBGBEG7JYzjxBBPl8
 pRre/Fl9MaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaOTf6gAKCRAEWL7uWMY5
 Rk3eD/0f8Krqvn+ehSx/aGgx/Z+jrHzHgRtE++NieYt4mvpXcKEPsfvaOKDxwFTVFPV9DV5kzJV
 TstX2/turYRCm0YZCrQ+LiXfudTuXEIyfhNjGQgjqRD8pP8xIlEwidLd8yeMF06a0w7C3IlGnoX
 Thoyo5fR7UubjX04nJMMdeXDBWPhaH+F6xaygp7S3+l4hiWhZjhVT6scfMklKbNoplswK0F0Ve/
 hQqJym3Qnb1beaBHbfG0wMY7VGTYSqr5x90Lrk+SmrI1iHFyzJFjGaFl6Pag0q2O0wRx+GXEaWx
 NjG9BTB3K5y6yNQXJGJXOakaJjyrPy8DXgv5ExRlfI8XJtRAg+4jHyjFZvWzMGAPfcQSDAqCC+B
 lHAcx2JRE6vkg7cAKRAQUExmP0sXGSICxY51yBiNgkN05Y87Xu1paJSGH7ERS0WyooaFOpJU0dN
 08kIETVJ60y6pG9pxx+Ac9B5xUrRTedpgixCofVmK2o1Ot9GLTWY9uHZxRDaviL3up3Jj8YJG9p
 bVooruyZIpqEao4fgCbTP9E7Enqj9y8/gm+G+kf4X6aeb0AlVdD0G8kuny1mGIfLdGbCEIGqrR+
 UdaNbYp56bd4tDTIMeLOuVnZtzNsJ4Do3EnIWkvtbohUCVS2TpYTYSWt5Gyr95sWVQJMYftfaCD +XqNhuEhsWjzvIg==
X-Mailer: b4 0.14.2
Message-ID: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
Subject: [PATCH v2 0/3] Fix three issues with freeze listeners
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

See each commit message for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Add fully frozen fix (patch 3).
- Link to v1: https://lore.kernel.org/r/20251004-binder-freeze-v1-0-fb9fcdcf2b73@google.com

---
Alice Ryhl (3):
      rust_binder: freeze_notif_done should resend if wrong state
      rust_binder: don't delete FreezeListener if there are pending duplicates
      rust_binder: report freeze notification only when fully frozen

 drivers/android/binder/freeze.rs      | 18 +++++++++++---
 drivers/android/binder/process.rs     | 46 ++++++++++++++++++++++++++++-------
 drivers/android/binder/transaction.rs |  6 ++---
 3 files changed, 54 insertions(+), 16 deletions(-)
---
base-commit: eafedbc7c050c44744fbdf80bdf3315e860b7513
change-id: 20251002-binder-freeze-f99e23dc47bf

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

