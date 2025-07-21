Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42759288AD
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 02:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753063450; cv=none; b=lo/SraZjXtPmzEfBCeojl1h/yUvGdquaqk9aSFUoYOlTEPfiQOWr6pughV35mdi9764gxQuH20oWoE3Jql1RoRNbV+iBgGGMHHkW/ABc4r6as7f6g9OQulfvPwap/6n9EhzUUY/lHKUTZw7m+/pJp+JKnOKD5g6ynA1l3g55E2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753063450; c=relaxed/simple;
	bh=MuOPTDgQU29247DLgY8+Lmyrxez7rrt9iyp3vKghqp0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jeE+WAykxNMrJd1hCpktNVpu3UQKREDACyszE8C1Z/ed3Vc4rZYDaMrPMOTrqU3P2cVadURr7IROFQ7mQVnDHcN1KuwFzPdNSI4L/IXhQIP/hXp9BpC+CIXSXZ8KRJPJPJa5livGmtgSplKpoFZrvu3Nm4i+TrMUMkYt9YzbW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=UJc1DpeD; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="UJc1DpeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1753063441; x=1753322641;
	bh=DVoGha/incWcNsAyXcYxtSakFRN5uHI6li9pSOPUlhc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UJc1DpeDgXyi3vpoJDdoDZH8foIb9DgN6J4RUseF+GT4sJOcZWn+oA0ijMWOWVMEg
	 Hdpzn1RYHvsiXGmRhUGJk7OgExHig5dEnbyBxeD0ujRt1FZ0cBNwMeb99Lb7RZFP17
	 GWubMu3B2Io9WSQi9eZZ61lMlzcQTbllYXrkc3Tcwxa0n52Ws12Nr/DLu9kDUlW1cu
	 8G3sOWHdyaWbIc97c+r7JTVUzGGSRw+S/0XeeEUVLpmDpfXLVvx/4hxf2jFuakK1g4
	 hNpVBqVip4RcVNgewa2MzIAB02+1gPQFvrUCJgZ2rjiVikCylrzmQDkZ7Dkc0VwPTV
	 lHZOKnwC3OqGg==
Date: Mon, 21 Jul 2025 02:03:55 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benjamin.tissoires@redhat.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, jikos@kernel.org, ojeda@kernel.org, peter.hutterer@who-t.net, tmgross@umich.edu, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v3 1/3] HID: core: Change hid_driver to use a const char* for name
Message-ID: <20250721020211.196394-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250721020211.196394-2-sergeantsagara@protonmail.com>
References: <20250721020211.196394-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 99781fe6b89aba0b964ec5d3474b3a36ab5492ff
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

name is never mutated by the core HID stack. Making name a const char*
simplifies passing the string from Rust to C. Otherwise, it becomes
difficult to pass a 'static lifetime CStr from Rust to a char*, rather than
a const char*, due to lack of guarantee that the underlying data of the
CStr will not be mutated by the C code.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749b..d65c202783da 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -816,7 +816,7 @@ struct hid_usage_id {
  * zero from them.
  */
 struct hid_driver {
-=09char *name;
+=09const char *name;
 =09const struct hid_device_id *id_table;
=20
 =09struct list_head dyn_list;
--=20
2.47.2


