Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC512857C2
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Sep 2025 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891995; cv=none; b=tY6TB/sOVVAcgSxG06x4O1qgcKv34mtDTiB8NSSXKWbv7mgVMgaU4DkXatzmDWOtEml8qe1CmU3MqKK+1z9RBGGk11MdB/AfoPrL+VFurv1MJ1FqzSoKKrTuCK2JY6GRflMbfz+986sAVdBrIlxqDstQ3uUZKFHocJqrLRLoEXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891995; c=relaxed/simple;
	bh=uMQrPsVoatO/qweCSMz0PCGRojzxgqhUQv+HHNkqOI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbCsrGh64uFrpEBOjIFU0cWBCaMeyicuo/iDIjEwc8tmOgOU9gGnOUJ2L4sd4WPdSX3v7F70vrq6VegO6T8PcSemSuBu24bi1iKrfmMGSEkQgHcbOx5FDuKTxGDC4X5yLrUhTlMmBWV+x8uuOBzQOdLwg2EZW2XZncBZmqTPeZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irpcXReg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irpcXReg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8998C4CEF4;
	Fri, 26 Sep 2025 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758891994;
	bh=uMQrPsVoatO/qweCSMz0PCGRojzxgqhUQv+HHNkqOI8=;
	h=From:To:Cc:Subject:Date:From;
	b=irpcXRegHZNeVzJBfCg/jIR8wxf6/oVqgxaiB6V0Q/cyj9+EmZWTakiKgZbJzy0Ip
	 o21j97FRZ8IfrSh2njzSPd5zJhlm5hVy2ZI4H+TrZtymOmkGx6CUPdReynRoicTHPs
	 AqlWqfJiwodstpP6SN5cjD3LYGo61cgxA4xkqvrYM+qAy4SFYU6zdoR/Y085/o+1ov
	 VhnEby7Mn2ReKFId6o+nJooi6GpE5+2dlUzLC/oNy3Tt6v0AXs1xW7f/S2yrFXqswM
	 KAF9cCXgzrZdfXLX5+POEf4+xvwZScmo0mO6kv5OYEeODTcGHDy/aXmT9HKdbdBk+H
	 oJHZ5owLoFCyw==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: gsp: remove useless conversion
Date: Fri, 26 Sep 2025 15:05:52 +0200
Message-ID: <20250926130623.61316-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Meanwhile nova-core depends on CONFIG_64BIT and a raw DmaAddress is
always a u64, hence remove the now actually useless conversion.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9b70095434c6..ca785860e1c8 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -202,8 +202,7 @@ pub(crate) fn new<'a, 'b>(
                 let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
 
                 // Fill level 1 page entry.
-                #[allow(clippy::useless_conversion)]
-                let level1_entry = u64::from(level1.iter().next().unwrap().dma_address());
+                let level1_entry = level1.iter().next().unwrap().dma_address();
                 let dst = &mut level0_data[..size_of_val(&level1_entry)];
                 dst.copy_from_slice(&level1_entry.to_le_bytes());
 

base-commit: 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9
-- 
2.51.0

