Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752A26E6F0
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845823; cv=none; b=G6jv3Cws0KjlIUdTo/dKb/bZIcJ9saNWvSSn9zMzWhZQzjxZL1Vbwta0B4XTZZMoGNrlnFDYcR9oYPFWjfH6RUYDlZi04OIn37ZRPGpSzq2zitFn7r5yCT0pB9fZeuyOJi/p6fkoQ5iYRC159EYGUV851jRbZ4XSbEWDttboXUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845823; c=relaxed/simple;
	bh=CVSJi029GHHHhn/9XoqWc3ttenxPMOVdAkj46I9t8q4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GWKjgJqfACHnC4LS6L1LG1U+fyeymT8klib19z3ulH8bbV5jAvqUO7eWYQmOfB0OcfXFvul98a72cSSXZ/Q3LghybwDGhWbavqvY2/DB2Je2NKLZNbaHceQnRiFfU2XLvLmpFuOauT/RMkINJ4x2cipsSeXwBLiA6ALnKQ17maU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hK2EtDOr; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hK2EtDOr"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-bf493d248baso7076955a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845821; x=1766450621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K64SM0RdH6aTuScbaCI3LTVobbk/h/tZc4xxokx/oAI=;
        b=hK2EtDOri1Zzq5yW2WVlZElKGBUnKgYXgvyt3peMuawu4wHTV1XGduB6K9rqj4BOAJ
         mAkPXna4bPnebxfydv8G6lFfrijRk2pSR7jK5L4RFKXyeHrrOJXJRfdLgWmnxx7w3hPf
         W3uaikl52UZ1/OUoa/BCHh6l+FsQj6E6v/TGmtmAhd0FJpAkDJOCKf01FAD8w79L5Qx6
         KoS/Cm0vUGAI4aTdFGoHzzbYVPZcZ6ZlsEhjhO8dkYMPKe2NXQ5ugp9lgru+kJmhpKXH
         gyLTHpTOe7ZewUpdB1ne92Hr3S0xUY7XTAWzqoWdzmmbz+xG7UcUPOLf3SXfQTASyE+N
         lRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845821; x=1766450621;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K64SM0RdH6aTuScbaCI3LTVobbk/h/tZc4xxokx/oAI=;
        b=AYotEfMfKTlq91JtJZdX3tFKXtgERvrNa9XGfSZO1rLNBounD/WVAqXauloLffn9Yc
         Ul8om0mc3LARmbSf3A75DmJD6CcxukTK6Fg3T48GXREuZ/90+kMKM4yWQB1qBntcXLyk
         dOzlC1gQcHh13gMbu/90MpMTfMr7tu2aKcNe+yjaha1loDDAdDa5WbEkePlkGLU4cEvj
         K6MINaryD1aU6cAtP8yDdJ9xDaEovFPHNa1Qn5wNsDYR0gjGBo7Bxt5Yghe1P/0oNiT7
         yu5HRnAQMQh1cc0fMhb5fQa+oatNXqKwEkcDpitkTTcOLIa1N0G/wcPXcISW+v7xWG4T
         Hfvg==
X-Forwarded-Encrypted: i=1; AJvYcCVXK4mgjAdh4sU09ScXznMMNI7EBwTZbvRZgoT8iWIQzPAlS2d8uvfwlyNAEFbdZH7w/3gB4BQKxBWijCgwKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZoLDuREkXUViiDij5CYbP3pEz9/fUHYzMAg0tlUVLt6qEo8p
	WCN0d34STJTl3Qo16rlt/620QWQUh5tX4zP2mkWGOwfc8BuQhxAFpYiL0WPT8gu/NItP4ml9keG
	w5PkyIjfV9A==
X-Google-Smtp-Source: AGHT+IGy7t2xxDrYvztIPhA1LeA7jj9Vcs8MdVuvRdWzB1+Byz/o3bEuXDfRNqZ4LeILsk2gh3AYrKc33dom
X-Received: from dycph12.prod.google.com ([2002:a05:7300:dd4c:b0:2ae:372e:7e0c])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1a07:b0:2a4:3594:d534
 with SMTP id 5a478bee46e88-2ac2f86ffd5mr7676055eec.1.1765845821383; Mon, 15
 Dec 2025 16:43:41 -0800 (PST)
Date: Tue, 16 Dec 2025 00:43:34 +0000
In-Reply-To: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845816; l=1220;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Yq/lFcGTJAMxEgocC5K0vXqMYuCjGCsnZPv9LMzzDas=; b=/Y/ERfm2esLl9qZGHIMpak+FwybekPX2wT3RqJ2fYPhM0VMI1OTmhaOuytw0YNvhxHtgLEfMK
 5jA525oguWVDm7PLD8XYeGs4Imnxi+wVyFLkHI3PrsAm4K5Y7V5XeKg
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v2-2-1fb394cc921a@google.com>
Subject: [PATCH v2 2/3] docs: ABI: sysfs-devices-soc: Fix swapped sample values
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The sample values for `family` and `machine` were swapped relative to
what the driver actually does, and doesn't match the field description.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 Documentation/ABI/testing/sysfs-devices-soc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-soc b/Documentation/AB=
I/testing/sysfs-devices-soc
index 5269808ec35f8e2b18516556f886c77f5fac9401..cb6776a4afe02a76fe27ac6fc23=
6babdc7865287 100644
--- a/Documentation/ABI/testing/sysfs-devices-soc
+++ b/Documentation/ABI/testing/sysfs-devices-soc
@@ -17,14 +17,14 @@ Date:		January 2012
 contact:	Lee Jones <lee@kernel.org>
 Description:
 		Read-only attribute common to all SoCs. Contains the SoC machine
-		name (e.g. Ux500).
+		name (e.g. DB8500).
=20
 What:		/sys/devices/socX/family
 Date:		January 2012
 contact:	Lee Jones <lee@kernel.org>
 Description:
 		Read-only attribute common to all SoCs. Contains SoC family name
-		(e.g. DB8500).
+		(e.g. ux500).
=20
 		On many of ARM based silicon with SMCCC v1.2+ compliant firmware
 		this will contain the JEDEC JEP106 manufacturer=E2=80=99s identification

--=20
2.52.0.305.g3fc767764a-goog

