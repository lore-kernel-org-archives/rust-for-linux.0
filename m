Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6433A718
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768045970; cv=none; b=noUDIKUihhzFBu7xBMKVz0Fcvgh+hSXWycq7gpWBi8gbRgdujv0bvNVgk0LXEL0R55KlyjGNFT9x8gQB8q1YfXF/OBSvYvpRCL5yUGU91kRoYyHJu555vVCPw6449jOxTzQzZCICQaTbTsfUasH8LZnbskaQrt1jzNHm43D56Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768045970; c=relaxed/simple;
	bh=0tx7KBM8JOR2cGUyKtdIZGjU+9Y0b1hnlzFS4JcuTFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkNte63LSU1jA52tq/s158BShg12ji8oUNSNqmAa8KYRzOvcfz9OTZMgA4FzX6E1df4iHBJRUvxr8mL5u96h9gS8pXmGCVwTb31NimvRV0qjUSDgPpCqETMVD8slRPxplD6rdcwy9TsgsuUwOVq2P/VTNuDHgBQjItCHbZ6XKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fD3nAcf8; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fD3nAcf8"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ABWCFe953476;
	Sat, 10 Jan 2026 11:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=8evvbOTEaXjLzXrdFcStSnQJPm24h
	m7xY1A1ez+NMq4=; b=fD3nAcf891bCwH/81r2RMQ6M8c3djkCgzSQjSweczxBCz
	RihR1btqsInTvZlhwi5lYCLUxKVXv/TKXLpiT9nwNNOHMTW+ndByOV2S9RobjmNj
	hUU+4gOpYGrdo64AofLCI/45YGCmNPMlknguIuXyv37xpmy9mAXj/HiihRd2M1IB
	9Ta25qrOXEmhyzspDN0wT9g0Wy0BGE6m9Pljd7p/AsQ3BtmwemJJ7H3KBB+yI2Q9
	hCvI/5NuJn1GxKphQ19kyoToO4R4bqvL05hQpVpKHhGKG2VH351jFWUl0USY5fXh
	yvKyYNgchYMATzaygbXTqGhtmV+yKm2dWgj1AQrDw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb00bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 11:52:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60A78BWq034682;
	Sat, 10 Jan 2026 11:52:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd760u9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 11:52:34 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60ABqX4Z005630;
	Sat, 10 Jan 2026 11:52:33 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd760u94-1;
	Sat, 10 Jan 2026 11:52:33 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: rafael@kernel.org, dakr@kernel.org, tmgross@umich.edu,
        aliceryhl@google.com, a.hindborg@kernel.org, lossin@kernel.org,
        bjorn3_gh@protonmail.com, gary@garyguo.net, boqun.feng@gmail.com,
        ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] rust: platform: fix remove_callback invariant comment
Date: Sat, 10 Jan 2026 03:51:56 -0800
Message-ID: <20260110115159.2313116-1-alok.a.tiwari@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601100101
X-Proofpoint-GUID: FFrWey_-8mSThA0x3sO6OX9hFs1nPRl3
X-Proofpoint-ORIG-GUID: FFrWey_-8mSThA0x3sO6OX9hFs1nPRl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDEwMSBTYWx0ZWRfX4Y28mmmX7Pyo
 fx/k2K2mqpwiB1/nlRlwX2KJPv/bzxOf9LCYdXgTIywa5xcD3FUKnq897gc1bSVA7IedHHls8aU
 I5q58yffvz0Eo5JmiKPK2DxiXmoeZKeJ/edKGGbKjcPaDcjKsWTBqktZfFHa6j4CtNftcITEJdD
 xvsMNSbNnFzDfRGQJDSS7aBYtZZ46I32fdC/zZ+J87WH4zhlVS/gFpZVMCpOi/QwVM7wiJgtE+S
 8JcXZYr3m9kQMLnSCrlTCJIZS1GhFqwrOuatroXQkTEHKcwD74Ay+ed8cv4hDWT8uo7AsgpViYT
 0cnwsibriHjiHis6+VHb4iaiMdxjct5v+vh3+2HapsVcTup3qWXded2E4qSAJRFWvJYPKsXm6W0
 yhq5NFUK6eaw8r/OB5nx0ybAC/htuo08Alg/o4VxjMTVOGKJS+2jwtX26Milp6jkQgSOBoXqltw
 OH4S3vpuEfnTwsB6Fsw==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=69623d83 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=ECrztxN37Yn2SkDrXR4A:9

Correct copy-paste errors where remove_callback safety invariants
incorrectly referenced probe_callback().

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 rust/kernel/platform.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index bddb593cee7b..29f00e4e54a2 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -86,7 +86,7 @@ extern "C" fn remove_callback(pdev: *mut bindings::platform_device) {
         // SAFETY: The platform bus only ever calls the remove callback with a valid pointer to a
         // `struct platform_device`.
         //
-        // INVARIANT: `pdev` is valid for the duration of `probe_callback()`.
+        // INVARIANT: `pdev` is valid for the duration of `remove_callback()`.
         let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
 
         // SAFETY: `remove_callback` is only ever called after a successful call to
-- 
2.50.1

