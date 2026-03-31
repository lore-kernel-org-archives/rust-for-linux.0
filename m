Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48F330B2D
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983945; cv=none; b=ljaxDwuoGFBWjEUUjAuXLhwf1ychDb/Ak/RNLUHAYi//AlQ0jnou1+dqqLM78wHw3LFkXoFNaQj3yy9T2d6dMOPr/ijDVnw7SX5UCEUdZIOH0nx1ntlRWF5ia9zY+MdZoqLugXpW4AsiJe5kFONHh45oyT/+2TASftmfFtbBj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983945; c=relaxed/simple;
	bh=C1YKxrXBqbKw39Dp02xbr1jrLyYgek7NN51IEc+VIus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qf3ZQ++jT8NIFAhp/QIcn4gNISnvZbhMN6zwotrW++dm3cQXLnme3+fO5iWyD/RZyVR1r70vfeKuT1U8uBxcdm8JpIBxz2eSV79K4uLQ6DxG9rpUrBaCJijmHEHMhPFuvTUKtzx5hvqtLtuY84XBizTAfRZxN1iduWObEKlqeBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=prRDTf6Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pw/pZCbj; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="prRDTf6Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pw/pZCbj"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id A5E441D000C9;
	Tue, 31 Mar 2026 15:05:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 15:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983942; x=
	1775070342; bh=wGa5YtWOznIXXpYxSgNVb9l+39T5JVJdqRVtxL2/f8Y=; b=p
	rRDTf6YtLYGI11SN+LbDnXccahPojfQ0pyQljTUzXToWlT2X2jR04oNj2KJoN3s5
	06Z/8faoB/8jSTMM4DhBy/9eJzPRySS/nFYTrjwW3Sq963A91oabAoI+p18jXPkp
	YMZv0imrVzkN2G+58VhKywBoNrBgLbksK2YwEK90XeBH4zjlVihqRqn/cnBF3LS7
	DkRXYJWbs3vzD6ovJcABtVPvLrKkN0fN3pGh++/Y+pLcdxZidA+aW5j+m2LzSb+n
	Crl6NfMCXP5j2TvU6BcbTcaSvIR+yt3vS4DgxL68AtyyfT0g0vv+4shH1fF3Rakx
	84f6ibXlvhqA24Kw98FGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983942; x=1775070342; bh=w
	Ga5YtWOznIXXpYxSgNVb9l+39T5JVJdqRVtxL2/f8Y=; b=Pw/pZCbjIGV9EICe4
	1R+TfsUAnFvV2BZSilWme1wWUYukYlTgTcDBAdJsSknqf6ElehfxND1J2Rv8YoAM
	XELzKe6BODQ0A8ZgsZAQEr0i+gOIYzMEAQrXgHCXfFZGG857S6WR8wv1uYPXDEsH
	jQmrNzmvldxrWoBUUIVREgXdj1+Ls26JRLKRlPjA9pqlx4WldxIw8BJBpKTX3g3j
	CAvjpfdynCp3pSb5VrSYI1ACuMlNO9CLkE3NSgykpk4iNIse9o73CuTT3y3zul0E
	jADoYpgkTyinS43rtQuXGFE4esMpRgc1h9HCk0r3sFhmF0GLgflicdBegR8ZfDND
	1OcsA==
X-ME-Sender: <xms:BhvMaboeIVv-0KladILK5wIqlArB26Grv9xcT9dSq2kqVubO3fbSIg>
    <xme:BhvMacrxW5HlONOkOpzVf0PUrdR7w38bXGxYOE6glMeYh2inEn-F3jD1VzYE-C3Lv
    UsdQrcBWDEe9aW9-LWAGiYMU7po0fAiHnlybQkH_KmDTcW2rzeAOdk>
X-ME-Received: <xmr:BhvMadN8g_9_0Z29tsRAevBK4E_meNCw-UXeRPHzKaMAo1j6_yW2DWORT6aXrqV4GRxhOCwLnjq_mjLq7Zls-c8ipHxbyOaVE2ZpT6M3rhqY7CMdLy5yUR4V3wQkXufK4VvtZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueduudehfedvtddtudfhtedutdetffdukeefudefieehveevudeutdeivdfg
    teejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepug
    grvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrg
    gurghhvggrugdrvghu
X-ME-Proxy: <xmx:BhvMadzFxdIojo9pu6Zp1t0EoRExEiuwdZK46XhtNBnjR4KuAq7d8Q>
    <xmx:BhvMaWscCkrKE9CdMKEAjN9E3wfISZC3gSF5LEA3qp90ceDumTsIyQ>
    <xmx:BhvMaW6JEOebhbcwPlsAqOtXGrlmlYzrBsdo22ruKz8lsbGOluTy7w>
    <xmx:BhvMaVRr1toZruySyxLExT-piOWai_IXCCjOb_TOtf1F2dUL4vtR0w>
    <xmx:BhvMaaY8MfFwEc2-Qp_e6C8uN31CL4D3BeqTVC9S0x34f8HsMvj0W_0K>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:40 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 01/16] rust/sync: add LockedBy::access_mut_unchecked()
Date: Tue, 31 Mar 2026 21:02:53 +0200
Message-ID: <20260331190308.141622-2-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new accessor to `LockedBy`, which allows getting mutable access
without mutably borrowing the owning object.

This is particularly useful when having to lock multiple objects under
different instances of `LockedBy`, but protected by the same lock. In
those cases, the caller needs to retain access to the mutable reference,
so it can continue calling `access_mut()` on the other instances.

It is now up to the caller to ensure the provided reference is held long
enough, and a single `LockedBy` instance is not accessed multiple times.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 rust/kernel/sync/locked_by.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/kernel/sync/locked_by.rs b/rust/kernel/sync/locked_by.rs
index 61f100a45b35..8aca521279b6 100644
--- a/rust/kernel/sync/locked_by.rs
+++ b/rust/kernel/sync/locked_by.rs
@@ -166,4 +166,34 @@ pub fn access_mut<'a>(&'a self, owner: &'a mut U) -> &'a mut T {
         // SAFETY: `owner` is evidence that there is only one reference to the owner.
         unsafe { &mut *self.data.get() }
     }
+
+    /// Returns a mutable reference to the protected data when the caller
+    /// provides evidence (via a mutable reference) that the owner is locked.
+    ///
+    /// Unlike [`Self::access_mut()`] this does not require the mutable
+    /// reference to be borrowed for the requested lifetime, and thus multiple
+    /// different [`LockedBy`] objects can be acquired simultaneously.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `owner` is different from the data protected by the lock used
+    /// in [`new`](LockedBy::new).
+    ///
+    /// # Safety
+    ///
+    /// The caller must hold `owner` for `'a` and must not call into this
+    /// function more than once under the same lifetime `'a`.
+    #[allow(clippy::mut_from_ref)]
+    pub unsafe fn access_mut_unchecked<'a>(&'a self, owner: &mut U) -> &'a mut T {
+        build_assert!(
+            size_of::<U>() > 0,
+            "`U` cannot be a ZST because `owner` wouldn't be unique"
+        );
+        if !ptr::eq(owner, self.owner) {
+            panic!("mismatched owners");
+        }
+
+        // SAFETY: `owner` is evidence that there is only one reference to the owner.
+        unsafe { &mut *self.data.get() }
+    }
 }
-- 
2.53.0

