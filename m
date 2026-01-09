Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ABE223328;
	Fri,  9 Jan 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945944; cv=none; b=ZfsC5D/fSwLOv+11qdRpif+1FqNTIwBqYh2M5vf8189pDorYaZDJFnOkDYyw3EQzbAsx1unWcTS9VIEJzJZb2CfWepq71mPnOU/9+bbx5QOG+6V84/lvk4mxBimg9ySv8MeLlWk5T1GCI9Hk9SOF0GD/lcd5/ZzCHjAI+bChFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945944; c=relaxed/simple;
	bh=kalXybBHS/xg/wY72QKyPcMt2e8QU6yRfYMIYOd1V3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LNyn6FvwhiEOO4ErlDAJd9laSOPlG8jKv0ruNCHOOrwUr2JR4Vn9qdGFa5dV09TIVevALife6lWedqeBi/IA6ZeMVIISEGiP/0fb+7z14wumTUEku90HeET1zsQ5R+b8SOC4HzKPmvDrlYYSDhHHtVWJ6W2s/Tw8fxkACjryQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f8d8d998ed3111f0a38c85956e01ac42-20260109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:56a9b6e6-104c-403a-8f06-b5b7299af693,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:a9d874c,CLOUDID:c7d1c41666bab51a03e908a2b6145e34,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8d8d998ed3111f0a38c85956e01ac42-20260109
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengfuyuan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 546239298; Fri, 09 Jan 2026 16:05:33 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengfuyuan <pengfuyuan@kylinos.cn>
Subject: [PATCH v2 v2 0/1] Implement generic accessors for the platform data of a device
Date: Fri,  9 Jan 2026 16:05:27 +0800
Message-Id: <20260109080528.478731-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <DFJ5ICRD3YFF.XCSV3CJCDORA@kernel.org>
References: <DFJ5ICRD3YFF.XCSV3CJCDORA@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is version 2 of the platform data accessor patch series.

Changes since v1:
- Changed return type from &T to &Opaque<T> as suggested by Danilo
- Marked the function as unsafe due to type mismatch risks (no runtime type checking)
- Made the API available for all device states, not just Device<Bound>
- Fixed documentation to use the standard "Safety" section
- Rewrote safety comments to explain why the conditions are upheld

Other notes:
1. AI usage disclosure: Yes, I used AI tools to assist with writing documentation 
   comments and analyzing existing Rust for Linux code patterns. The code 
   implementation itself was written by me, but I should have disclosed the AI 
   assistance. I will ensure proper disclosure in future submissions.

Thanks to Miguel Ojeda and Danilo for their detailed feedback.

Regarding the user/driver:
- The driver we're developing (a simplefb-like display driver) will indeed use 
  this API. Given the API needs redesign based on your feedback, I've redesigned 
  and resubmitted the platform data accessor API.
- However, since the driver is still under active development, it's not yet ready 
  for submission. I understand Linux kernel development requires no speculative 
  APIs (APIs must have actual users). I hope you could review this implementation 
  for feasibility (without merging it for now). If acceptable, I'll continue 
  driver development based on this API and submit both together once the driver 
  is complete.

Thank you again for your detailed review.

pengfuyuan (1):
  rust: device: add platdata accessors

 rust/kernel/device.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

-- 
2.25.1

