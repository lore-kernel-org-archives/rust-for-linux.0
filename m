Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312213;
	b=qqWfgSXMTtUp3oOPbrs42ZAwJ0pTxrpXyshIaRG/y6VswGyCdmaY8F+qO6k1lGAn51l8
	 V3eGn0wIP8baBzb8L+9Ymsc/BPTs3CdRVcCN6tOJbTAVoiOc4IdR7AzmQQ9QkBTdQzf/Q
	 37TsetLhQ6qMRAfhIxiTUNo1U9BXjq2ZV5pNnTwNRe1fyI3pt0XDyPZUj6mn1E6eB/DJe
	 ACBQNVxSztGULOzXGVmCf1RuMcqNGTHuyVwK4Z0q19BaTWvINYDBqfj2MgR1ZMH9wqecO
	 FbnZ2Ns6tvp0kc07YAYBaVgV3xtixa6dPkaQ00HcU/fTvrKj/EGIBq3S0dSwHEKPWfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312213;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TI1T5UEakcFCW/hN65+9GVK1NvkYkGyn8kT8/oGVat4=;
	b=AYFKezmEHKgpu6xm7335wixeFn6VapSqskxmdzkQR/XmtCKpMabEwnEuK5g/4Tw1oxXk
	 +G4RKNQB/cXLpyFkb3ovfD1ngShY5ByPEiOWjM8IGAO2qOOURFFLTrsfpCAVk7QNNHeRU
	 JYhLcPnB4v3JTysIuToDpLpN+r9MnRJPo/JfP7VgpE1upsjGDdDFbXpvFWS3/RGOrEGoe
	 fyMe+YIlSdc1EjvT7I6mPVvDyYI32mEcudGsHOsLjq9fIIjA4uzgwudtjC6K9w9PM53ca
	 3nnshdzw5dapzWD620BbcJF0CrvXn76d7PSiFawHC/CWG+on5EfoG/89qQg7nphL2RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPocwhfr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0ED606A321;
	Tue, 10 Nov 2026 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPocwhfr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38B51F0089F;
	Tue, 10 Nov 2026 12:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312213;
	bh=TI1T5UEakcFCW/hN65+9GVK1NvkYkGyn8kT8/oGVat4=;
	h=From:Subject:Date:To:Cc;
	b=UPocwhfrTcka6Jg9F8LF7zn2qR/0V9QoQoXrd3GozUtn5Hk0w1nDCmDSEp4+87mBE
	 3WFAAzcj+rgUdlirlEo1Mgn97Se9rCjIiJRh/jCDf5qAtl8+PqC4HRTd70YK78XeC5
	 4BghLIMT1BcaHMlHkU/KRF/63RovlWUFT1VTz0/Wnsx9BB8uqFcyvWauI1Wh98paJn
	 VT8jN47ZwM+o+DUcD3THeQEj2JJH/hTu8h/+fZULBTTuZirj+VKGC+WWjjk82CKMDB
	 M9vmeDN6jfjsy9yDBousXx06QjAZFr8O/BESOqB3I7zggOdTjG9pMIwoF/viFrWqn1
	 K+qsluotQw7/w==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
Date: Tue, 10 Nov 2026 12:03:06 +0000
Message-Id: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAviI9O7BjKvgV8eC0ai9ztKDC2N+dH
 gNJEigJk8JQJRC6WPkMBbCuYDnmsJPhtTDYxnaI2JhVzmg+k24SPTiqsZ1betd6RN9CCaPQxs8
 /HaecX89JO6dkAAAA
X-Change-ID: 20261110-drop-reviewerships-264c745b11b5
To: David Hildenbrand <david@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Uladzislau Rezki <urezki@gmail.com>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=ljs@kernel.org;
 h=from:subject:message-id; bh=dCVSMtwDwE7/hcxW0886EMv9/VrEruWg6lsa6zaZd68=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+c3Be6f/26HzVeq+JU8/vM5fUY/1mb6KfoHhgefdhx
 uO53FzlHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiIwmqG/ymsz79EHL8mran3
 uVx+iWiWmGgou2Lu6eiv8xm4OZP4BRkZVv85HZgX99aSgyf9qmER4/57m6zS9A6ZTxfOnGj6c8Y
 1TgA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Given the current throughput in the kernel resulting from AI-generated
series, I unfortunately lack the bandwidth to generally be able to offer
review except in those areas I maintain.

I have separated the patches into areas maintained by David, Andrew, and
Alice + Danilo, so each can take the patches relevant to the subsystems,
for convenience.

Apologies for doing this, but given the current trends I'd like to do
something to make my inbox a little more manageable :)

Also add a CREDITS entry for THP, as, since Zi's rightful and well-earned
appointment as co-maintainer there, I have no fear of needing to step in
there, and so would like to record my time in that role.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Lorenzo Stoakes (ARM) (4):
      MAINTAINERS: Remove myself from MM core reviewership
      MAINTAINERS: Remove myself from MM misc, reclaim reviewership
      MAINTAINERS: Remove myself from MM rust reviewerships
      CREDITS: add entry for THP maintenance

 CREDITS     | 6 ++++++
 MAINTAINERS | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)
---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-drop-reviewerships-264c745b11b5

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

