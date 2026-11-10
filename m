Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312249;
	b=e0p+APjTpsdwMKF+oAQX3Hc/ua1ao0YM5ptZ4e6B7KlIEr0nqT/yZGPVKCKNCuEspOIL
	 zWuxj6YH3uZC2834VkGwbZLOPimz5LXA5EjBSeM5u09IT1W0aIAAyu/yGUxmoh+akaBEW
	 edov/JJNNH94XeQQvXAR2HR4As1///Zomd1PnG7Jwc1VeA2Ne4fDvB/d7Oeu2TKf9ppsD
	 n4sWqWOX1IDG8nxf9KwH3Sz161kzOMQ8SVu+hzYDcBw5cyik/3npAfdEYuM5fnM9pdlv1
	 tF/mczrMzRmPiCa/hNbUZDex69Z90nuVrP8dNowYGN2aC61cujHQq4UIiqBs1L8X/Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312249;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JzZk1RLuM8spDo9JKHdWOYveSLRK6lJWUSM1rGChjXw=;
	b=r+KOoKOeRKuQFI414eFrj7CJac/BN743re/Ns/vY+usBwevKNIYw2uDl7cqEv2Ld7lCz
	 KXtRIofAhq23YLe8nQkorS1FlXz8Dk/gPxttQVPK0ZTYaPlsnqMnq87wK36BEWoJNq1NC
	 BRqRt7yAGpgolkf527E4O8osgbR5a8YD014eL9XDSy1jS0hnyo5+Om5urRyjWQCQJLMG3
	 B2xUyJAEV3fwZSpCCJqj6DtmBM2Qrap2PcvaYDGR1vmqSdmEyhBGUl8mRVjwA/vhpXgCn
	 bp6cmEB149xEKlvkAWpgEPWZQlk0AwM66aM9KFouXeALr69H6E+4jjTXRhqC7XWTMEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Boff+uIt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E8606A31C;
	Tue, 10 Nov 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Boff+uIt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674FB1F0089F;
	Tue, 10 Nov 2026 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312248;
	bh=JzZk1RLuM8spDo9JKHdWOYveSLRK6lJWUSM1rGChjXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Boff+uIt4fpQBBVexb0HKl7uHzWduiQHV5j/QhpigCwkTTzCn8CHJUM8gE5r67mxm
	 0yDoKKLtbzCXTUsNCKEW1YHWAt7GZsJkzXi98WX8NKCXNeS52hE4R4ddyCmYCMNkb1
	 lv+kSHWYcDoS81Fqya38IMEoVZRHbn2wkLe0sk+FArsO1oofAc1b3IC2yK5sFiQWhh
	 JQBUfcmJtpbwIDLQdrruaKNscGQHe3mN2dIIff16DvI1luvrK7F98qdeAK1Bk1Okom
	 TGk9MetqRdIVkj/UkUUdgb0ZRtFTrAUjNHS+SAsngeJi8m+LQ8iNWh6UTkE6WMCfbY
	 N0mn9TUVVGfLg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 12:03:10 +0000
Subject: [PATCH 4/4] CREDITS: add entry for THP maintenance
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
Message-Id: <20261110-drop-reviewerships-v1-4-07c2f06e8dfa@kernel.org>
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=ljs@kernel.org;
 h=from:subject:message-id; bh=takUyaLXbztd4jtf7ScJW0qPqBvaRlKq7K6u3UStV5g=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+c/C82LFW1a0juPf/vOPpOd4/Pefz3888sXjy6VMFc
 UbbsgNyOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRvHJGhjMKf93myt9s0aiS
 mHONizlf85P4tf1RTlYzV7qv62C8v4+R4Wrerhx19xVrmie7N5xZseudVifb4o3b/XZx3F6QdXR
 2CScA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Given my workload and current areas of focus, I think it's unlikely I will
return to THP, so add a CREDITS entry to reflect my time as co-maintainer
there.

With Zi being appointed as an absolutely worthy successor as THP
co-maintainer I am confident in its success, and this additionally makes me
feel that it is unnecessary for me to return (for the best possible
reasons!)

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 CREDITS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CREDITS b/CREDITS
index c6c7b173b064..226a71e45edc 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3939,6 +3939,12 @@ D: mandocs and mandocs_install build targets
 S: (Email me and ask)
 S: Australia
 
+N: Lorenzo Stoakes
+E: ljs@kernel.org
+W: https://ljs.io
+D: THP co-maintainer
+S: UK
+
 N: Henrik Storner
 E: storner@image.dk
 W: http://www.image.dk/~storner/

-- 
2.56.0

