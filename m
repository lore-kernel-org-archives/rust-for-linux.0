Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485719;
	b=17kjvVk4Jsk0+YM4t9S+bTSnWIufe0oBWD9hmzT/OzWnoFHnwTPVZGefwZaXhzvl6XBl
	 m0irp+M4Ggx0kX0mcf227erdEVi/Qg8p0PO2QgW/vnB7iNnDzMct7duzPnMDAyr59+3vV
	 OHYoKw8dmAxzIlHVBegm5nclEUe7Zqbc8FxKpDNM6BcFAJEs2ioqdIHM2VUh+00U7HBtF
	 hYptto8zISzi+iErwMmbnMJ1vuCVYwgfSU4UcXCaIYBEO5UHNVq9qwMHbHijyCP7/vsJ1
	 PLyYOsT9Zwl5m2W/4o3c13scV+lI562wVp5rj4x4YNYgCwpUMFpr4wOEoePRG4kaFlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=w8vKr7ISurIa66CKb2bSb0lWJTyTbVCUKm48dux1Buw=;
	b=vd4qjuEjDG2FC6G+CBZsaGQ62h7zercrY44oF/9gLJQ3YG3MV+deOCBfne+wx/r0hneM
	 TusXgVf89oeqfEfx2YGk4eaAzvjGK0/PPEVIts9Ntw7M1vpIhGd46DNge1CGLvK1v5prZ
	 hgsraySghcZhbU6PMnzYSvuGrlEUC7Z6/Q2pTNUUdOGVQ3dXOeEdRboU/5SOkHld7IEbb
	 KF5xPZcIA4WaVWyCnrWge2ZRD0ADQjbCdYv9mIKduAo+DCPbqDZSx+uwVzgP/B6M0duyu
	 uZVOZKI3zNhOlbecDRtU70iAIy7JvtFV07njX9+VOWLOj51rIRLqTof/DpN477wUz9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CyLQtps9;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA48606A32D
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA48606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CyLQtps9
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490c1867460so3121262f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 04:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794485717; x=1795090517; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8vKr7ISurIa66CKb2bSb0lWJTyTbVCUKm48dux1Buw=;
        b=CyLQtps9UupiTq6Oyph34jI/sl0YD7FgTwqNaa/INSZs87ZFaAYcf2O0E6XvG1/jwp
         C75DCPwoJq2vlOD7u2gYNgNiGHeiVy3b3CvCNZLexjOtzj0y7qe8mmjV5Ljplzf7F8l+
         8A7scmBG/ekrQ/z0NrHniU1sxw1I6Khw4KAgnR7uaZmyun8Aiw/9uOTUCFW1/D+DpOWO
         GO+eHF+vQsPxGfnEOgycWzLm9vEV7kSftzxSuq0mf1TfAtMcW4H0gA2Zd2GmvoMLleqZ
         dnBLfw7SkukSgaovDXjVVaod+HR5CZvb/IfWxND0klKLZOyu3dP3n5M5STlLYsVgHXrL
         Jqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485717; x=1795090517;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8vKr7ISurIa66CKb2bSb0lWJTyTbVCUKm48dux1Buw=;
        b=IZ8wav6Q9oukKZe3OiwqtePSxVYxik6UYBzLby4cqshTGUhKqtfbRvWz24HNjMnhTG
         L5sTp9v28tL5qZCsPirhXln4zRYmrH0N/Zvk5XE6iM5wgo+hZJkwZ+uhkSRG7pGm+yRg
         MkGNhuy5LFpcaHlYUP/7TWOI8q3I+MdAQsxgmvRndm3Q02plDsJN+qLyPn6uFfnECiSo
         EggVzXFPm3bMS3Dt/yFEa4P04NojeyeNlFxAk0bXVRf+Hvbi1jet3zhnIpYfJ/YTbfWf
         ueTeh07iV290FhGfBdRYgZY8P23DaQm8HAn3GWuM9DAKehY0vHA8uE36Pl9MTo4dzl1c
         uNrw==
X-Forwarded-Encrypted: i=1; AL+hErEOyqpxlnLS5RMkIQe0SCEqMWW8YTyLY023Fj9M7MMxH10H54BC9aHQi1JBnqR+MyzNh5+Cih6Mxcsj/0nVNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+18DYmaqc9GO+8OcYq7o/FGfwNEfLkVH6Pw1YgmlPbMtCurl+B
	uh65FmJRONK+qNlVOr9TiWhL7NxQl9BzJzXTQVLuYtdziGG+tcBdQFPRHjRP8V0Qp/Msetp2nSd
	xHxZNdMFHdSLbAw==
X-Received: from wrbdz14.prod.google.com ([2002:a05:6000:e8e:b0:493:1636:8f53])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8f:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4ba0935826dmr100851375e9.7.1794485716683;
 Thu, 12 Nov 2026 04:15:16 -0800 (PST)
Date: Thu, 12 Nov 2026 12:15:08 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112121512.1670347-1-gprocida@google.com>
Subject: [PATCH v5 0/4] clean up EXPORT_SYMBOL_RUST_GPL
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

This is a complete rework of the previous series to switch to assembly
as suggested by Gary Guo <gary@garyguo.net> in a review comment.

The first change in this series is a miniscule safety fix that will be
obsoleted once the Nova driver Rust symbol handling is itself cleaned
up.

The second and third changes switch symbol export to assembly.

The fourth change tweaks a related test file.

Giuliano Procida (4):
  kbuild: respect skip_gendwarfksyms in cmd_gensymtypes_S
  rust: convert exports.c to assembly
  gpu: nova-core: convert nova_core_exports.c to assembly
  scripts/sbom: update rust export macro in nm parser test

 drivers/gpu/Makefile                                 | 11 ++++++-----
 .../{nova_core_exports.c => nova_core_exports.S}     |  8 +++-----
 rust/Makefile                                        |  2 +-
 rust/{exports.c => exports.S}                        | 12 +++++-------
 scripts/Makefile.build                               |  4 ++--
 scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py |  2 +-
 6 files changed, 18 insertions(+), 21 deletions(-)
 rename drivers/gpu/nova-core/{nova_core_exports.c => nova_core_exports.S} (62%)
 rename rust/{exports.c => exports.S} (72%)

-- 
2.56.0.567.gdb80ae8cd5-goog

