Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432AC33C538
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616994; cv=none; b=pz9GllJMeos3heU8Hxcsn8tFIHBu6Ds1YG3DB1i80bKORKTsdNbd2+a7CL4nHUkW4OmOz0PFJqzJShfR6Lo8CUFSwp075TZSO2OFvVRqF3SIulTkQ9n5wZgzWiiX9BSpro7wdDnFG6uYzqF4aMMn9EK18UCjgqsbuDkuhsPWc/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616994; c=relaxed/simple;
	bh=j5GFWYSr1AZNSSJjCDOI7L4RZxER0Bd+jyzxlwm+3/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X643ERu/asnm7fKHDfPAHH2ZqrBqRVITzhwL0P7yRFF5SswzZuvnivQuBbjTynWSPBmFeolHDFMTdnVpinCTz17pLvKBaFFHziy/DYBaKk/pILAT0m9ryGnciG1/fDwSKR3G18B9cQvjX4oUgi8ts6J/5SHlsU+3TBwkNXTHyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QWNAElKg; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QWNAElKg"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43009df5ab3so8030473f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616990; x=1768221790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDKiZPDps4gNzrUXu4aY63b2fH6dAH2WTND4GKu2FgE=;
        b=QWNAElKgflC5pYDE/LBKMsP13KmTyRZhCTcGU+r8ioalzHnHXCeloyBszZZzYk3Dfc
         NtaZPpA/vGdho8ffFJs8mltRjDw3UrrkNujXBQcuT4FxDwWqccPFBTRhRU7ILQPk8knM
         mL8yrCU4pLvY0GeZDL8NiZ7k3thhzV2SEJOmJ00/UJrBYiRYccnbl0dGMAkqh7wdfhns
         3Wuh8gFEFg9Kaank9JQ4e5KEb/FdJExsLfthuWvPDoMZWNcTgWxHK8LXerMvICN/YdoA
         XzE4Jr+ldcMxZfyyxUi+iuKOZAlgtSvdY8oSdad7yLCI9GGVh0V2R1y4Ttb5B9Dt5qcS
         75kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616990; x=1768221790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDKiZPDps4gNzrUXu4aY63b2fH6dAH2WTND4GKu2FgE=;
        b=WSTitiKmZEB2nKKxJ2JMaW32uRSRlLGHRWVyXz0YRS4YKSI5J8W3Gi+69BkVQ4zx22
         zt4En/XQZfJRiOSwWWbB5Lh4QAyKuCNxqTulvkpYV8VmRo6hN921qb1GdMGbrEtivjrf
         yF/P4+2pF67Ev9cHDRplyTyYxgI1y2nuXsUJZhLeRqLqI6uawAT3WD60QxbNEXiR8G5O
         qjene5aMAJ06A04vpYIr8ngEXFtJPWZUNndF7Tte6EMSXn0Y5aZ91YgHvoEzwdw0F+No
         tvnvqKuzStdhWr4BcbiB8N94oTd4YSQWanInBpMMloaH9u1owr28kI/gmh4h/W/EzhGK
         lyWA==
X-Gm-Message-State: AOJu0YxllMCvDDdJyIyZRCQzEtuNENEHP7taDS86qEZv2bnzpg4wuxxC
	AewIoZMA1xEYdmMXbBHohc4oJzxJdU4Tbgr1BOiQr5/ySFwasU//g8iprXtH5GyuDj8GofWyJRo
	NVZRgt+rP6l12AHR3Eyx0+reonIVRB89PPVIycLDalP+q0JmwbWfXxmmodLhFLFEnNlcAzYY4WG
	b/rt+dsk9yjFs2Ktnb9SssWLdpAMniN6v1HTAXQ5PO6dcW4kn1GFyu4lULG6qoBDo=
X-Google-Smtp-Source: AGHT+IHmToTb2zkA1izcI2KXzu8TzW83VYafNzp9rHd91uy9++9pECi7GCfHtDlLZ/wd/+rvdP1Yc2IWgXXX5VY=
X-Received: from wro1.prod.google.com ([2002:a05:6000:41c1:b0:432:5bfc:a788])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2585:b0:432:857d:e425 with SMTP id ffacd0b85a97d-432857de5c6mr33370290f8f.30.1767616990587;
 Mon, 05 Jan 2026 04:43:10 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:36 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=j5GFWYSr1AZNSSJjCDOI7L4RZxER0Bd+jyzxlwm+3/k=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G9IsveeCqz2ptVxecNVTkOxYX65e1L5otsx
 X7jVN9WyzmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvQAKCRAEWL7uWMY5
 RnS+D/0SKDwlQOCJzRdK1RBnQGz/w++oe95AeWN07A2/++XSJ0of/WxMdyFD0EFtoDau6X7jli3
 Y1wfrBnAtQFxdr2mMEGZ4RP/6u+Jm1PBb9lPpAy9WLz1fSvVl8bIz0bR180zgfq5TMdGT90Gs/r
 Rwhrpm/DJZDYq02C+W6tsFCIYBuKA3L1Ov04GrLpG3jomrmjTQque1YAKyT6CsXjzBsvLea5TyE
 KjVr3I6k7Kd8MY4Mels0yUVz345LRdY+xCbo5PvHrDCD8HKWqoPR5Kki9aT3Vlnft9RmDIZkNhB
 iBZWt7Ou5KfDkzy9enU7EUc7dkVYyDQxR1ug3ZyJIGpdzaG29ShdxsBsyy4a+yiioaRY6DCOVFQ
 CsTbKPJQZ+RNGl+L5WGeNEvZPDsL+sAUbBzWSrfsLysEQZoNEtZsCQdwLQ7dUpuc+n07wukDt6x
 fE4WAZEyjDTXukXzwm1E0gP4STqAR08ucSw/0424VrzN1FJum/bk/O5zUhffR+DXit38JOVsE4p
 AshgaNjJr8naKNyxW+oJDkWplTG2OufNGNK4q6I4ZhWlEUpNNzbN03Ysufk96ddQwy3jxHE7eFv
 PIHZR3xkBU3UKLxffovO6QB+f8Rw+fkkV+dt/IiqQwj5tnSfHUXdhN+ZRUzb0fSdEFzWKKsS9gE ehjZRBVpPJr4cZQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-23-51da5f454a67@google.com>
Subject: [PATCH v2 23/27] rust: uaccess: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 rust/helpers/uaccess.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
index 4629b2d15529abf20d02352d587808b621749c61..d9625b9ee04669777e01af05034af35218557050 100644
--- a/rust/helpers/uaccess.c
+++ b/rust/helpers/uaccess.c
@@ -2,24 +2,26 @@
 
 #include <linux/uaccess.h>
 
-unsigned long rust_helper_copy_from_user(void *to, const void __user *from,
-					 unsigned long n)
+__rust_helper unsigned long
+rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
 	return copy_from_user(to, from, n);
 }
 
-unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
-				       unsigned long n)
+__rust_helper unsigned long
+rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	return copy_to_user(to, from, n);
 }
 
 #ifdef INLINE_COPY_FROM_USER
+__rust_helper
 unsigned long rust_helper__copy_from_user(void *to, const void __user *from, unsigned long n)
 {
 	return _inline_copy_from_user(to, from, n);
 }
 
+__rust_helper
 unsigned long rust_helper__copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	return _inline_copy_to_user(to, from, n);

-- 
2.52.0.351.gbe84eed79e-goog

