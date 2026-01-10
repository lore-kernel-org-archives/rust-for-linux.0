Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB345314A82
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768045754; cv=none; b=q0X0pJI6Wr8tt0MUUTjiICgcKbay3ZxgrcP7Oe2ncsu9lRsl/IBi16DI9K4FkqlPh14P8n6Mdpg+Y5hvkzirkad13DOubM2gjKehxCOSOqxVToHs1BJg3l0H5Whz5moOo2fqQaZLoaEGLFPV+4YivMnctD8qE/5MbCgFresdLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768045754; c=relaxed/simple;
	bh=ff9xYNxmDjRDLFFqtPWogEG3yOSSAa2Bz05g+bv4G8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4ISPGkoASLaMNtXtHhej1jX3ZTt7ih6glR836U0NQnx2OwXHmF4ZBQOXJnUtvjUPwtuWiKXnHA6K2FSd53OvbW4L/pgK5f5FNwl2r7iumhn7mqD0u022khk97czDQ2helIbKR4yyRcmKmn1IDPGJe0Z2MHcUKO7Z9F2edSlA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WnFF3i+a; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WnFF3i+a"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ABROkq660275;
	Sat, 10 Jan 2026 11:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=7PsGQwadMoiEPt0NXzL1FXVhem3JM
	KcLGxhDf/Tc48Y=; b=WnFF3i+anZpJQH6ecDcYdVbeTvQNOS4qxlBqNHPRNqOBW
	YFheloIqgr1SjOfQqzsZerv5wZxWCIhKCRqmc/gfarucQg+G3O0zW/RhkZ1s4FQs
	kAm8sEXMsh1LOx3PwfQPjs3/t4ESUG9sYr7kSXacMxYbs9tjedSrhvnI5cOwrVnp
	/1g7RNsx7IZBMqCKSMgeoIfFG0y88X4HfpNm4tLDcrK28wFcUh0h2k6R09BHtAOo
	ZjYAj2TLjRfBHQ3ASLHPxR3nVzpbUeOfcU0HvzWnQvPx6UjCqzVjqBlFlt+cMMQ+
	Sf9Pp5ACKszQn+Zo/T07g/JQ69kreSUmTf75OvuAA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bknnw80by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 11:48:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60A761KX004278;
	Sat, 10 Jan 2026 11:48:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7frrnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 11:48:48 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60ABmmXH006714;
	Sat, 10 Jan 2026 11:48:48 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4bkd7frrnm-1;
	Sat, 10 Jan 2026 11:48:48 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: dakr@kernel.org, tmgross@umich.edu, aliceryhl@google.com,
        a.hindborg@kernel.org, lossin@kernel.org, bjorn3_gh@protonmail.com,
        gary@garyguo.net, boqun.feng@gmail.com, ojeda@kernel.org,
        leon@kernel.org, ira.weiny@intel.com, david.m.ertman@intel.com,
        rust-for-linux@vger.kernel.org, gregkh@linuxfoundation.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] rust: auxiliary: fix remove_callback invariant comment
Date: Sat, 10 Jan 2026 03:48:13 -0800
Message-ID: <20260110114817.2312828-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601100101
X-Proofpoint-GUID: pUzCzsw89mb2w_-Ltx22kfj3ZMYlTsJY
X-Authority-Analysis: v=2.4 cv=StadKfO0 c=1 sm=1 tr=0 ts=69623ca2 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=kPjP206KKvcMK2SzIGgA:9 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: pUzCzsw89mb2w_-Ltx22kfj3ZMYlTsJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDEwMCBTYWx0ZWRfX8TQ1fQFv9IO7
 5XfuryZtul3ub97nouqBonujLbpR7KtAGSJ0lVfOp4cjN20jrsnD8PUsjdGonn9pXAoQCznnhqp
 tk/jQoJCrzlPsudUY7E4Zgt+bsrHQkapqSXmh/tDX9QwT/vG+ZcGNrZm7NDmNRpQvjEEl8Z2hbu
 9V9UWBYn47Gl1Tl2JP15ejhz0zbCc1JeJgGOb/Gul3M7cBuL5Nt2mjOCxRql8NCZFX/K+vXHPwU
 Lac/WdScPPnRcc3QanRin8Br7a6G0Pq+jHIqzXyvDvu63fogJ8DumOrLqOnYMgIbShFYfmgltX5
 Bsliyh242/3nMwRgMktlznT/BfE4KSRx6sRshi2mbr5JKifM03xjS/r44xcKB/BosyBoGTHrxl+
 /RGAdaISciYylGKnP9sRdMN8a6T61yaSLEqOqP0lv6cOfuuBCHRY6yroDDol8zvYuT2t7O+dJS+
 sGL708gG1GTcd9iCQgqpuJaoYu5AQNzODrkYQj18=

Correct copy-paste errors where remove_callback safety invariants
incorrectly referenced probe_callback().

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 rust/kernel/auxiliary.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 56f3c180e8f6..6cd7dee6c476 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -81,7 +81,7 @@ extern "C" fn remove_callback(adev: *mut bindings::auxiliary_device) {
         // SAFETY: The auxiliary bus only ever calls the probe callback with a valid pointer to a
         // `struct auxiliary_device`.
         //
-        // INVARIANT: `adev` is valid for the duration of `probe_callback()`.
+        // INVARIANT: `adev` is valid for the duration of `remove_callback()`.
         let adev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
 
         // SAFETY: `remove_callback` is only ever called after a successful call to
-- 
2.50.1

