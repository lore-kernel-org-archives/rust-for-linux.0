Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2B151991
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 21:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519102; cv=none; b=qzrW5XKqHavi45HLW1A3M6x/qRBLzSA7kr00EBWADZAA4ppuxgH7z+fNcnkaPvtwHsY0CvSSdeU79bSvxutstL0rKfWR3OGCGK/OMwqhZC4dsVD0lqJrtGDy54DUt2+54vwy2v8IRdUTY754zLWE2fehObBA8/h/oY56lrbYDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519102; c=relaxed/simple;
	bh=NUFurggvkxXgOluaZash4unAqOcU8hDUbZtTYCNNcv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=UfWRilj2m8Fhmxb8umS2zw/RQMYEkSdag4R5hEgSPNV5V4CNj2OCRSJzBIR7Y+OtTTtSQmnJzjX6Lt4hPwWRAnuth/tNsNahuNOZK6qh5Xxa/RU723umwrqJdswpUaJmrj3H2Zg4LXxoxLa8NYNi34kZaEb6ZZll9srjF+SpCLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kl2MUcRI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kl2MUcRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740519099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eYK7ysZSUvAOai5bptgOeyniZPVnEaS6uxFtbV6H7Jg=;
	b=Kl2MUcRIK/hqg2zu/RY1ZRXrkWeaLmySSHcFkC3nimDOywoyNlizBpxB2XNxofyaXyr/eV
	WQ1jv7ooh4tQHpe+Jd7Ix6NpFt24sE+Y+eMr14WtAgG8kc+6AS/Mk+aykRugNLgNizf0sb
	rdgwhGvhLihHBGqvc/ovgdy/manrOJM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-s83VStvXNoKmnwdAaCgJdg-1; Tue,
 25 Feb 2025 16:31:36 -0500
X-MC-Unique: s83VStvXNoKmnwdAaCgJdg-1
X-Mimecast-MFC-AGG-ID: s83VStvXNoKmnwdAaCgJdg_1740519094
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 136621800878;
	Tue, 25 Feb 2025 21:31:34 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.65.234])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 48D801955BD4;
	Tue, 25 Feb 2025 21:31:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 0/2] rust/faux: Minor binding fixes
Date: Tue, 25 Feb 2025 16:28:59 -0500
Message-ID: <20250225213112.872264-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ELtN1zTpTYwjIkEn9npMCjB2HiEKgXk4akRcw56i6IU_1740519094
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

I noticed that the version of the faux device bindings that got upstream
was missing two small things, so I decided to write up some fixes and
send them upstream :).

Lyude Paul (2):
  rust/faux: Drop #[repr(transparent)] from faux::Registration
  rust/faux: Add missing parent argument to Registration::new()

 rust/kernel/faux.rs              | 11 ++++++++---
 samples/rust/rust_driver_faux.rs |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1

