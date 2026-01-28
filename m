Received: from outbound.qs.icloud.com (qs-2003i-snip4-2.eps.apple.com [57.103.86.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75392E7F29
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.86.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601143; cv=none; b=iWgo9dvCf9bvUWRKNXMWz6ZuW71wa0aEGYlzL+WqUh+b2Ndyp2FzsrpwruQRa2VAJ2F6hUwq2+ZWkk47NK8WDdVMRArSm5X52MNIzwo0y24i+WGbVL8H1wbTcR1YTX5exT/PtGfOvw4fesfAxTSqTR94o6EYc39aeiQ1TnOkFfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601143; c=relaxed/simple;
	bh=O5jSWkRxTjrbiBytWiE4SJvQrrxfuOzLsZeCB6hPIXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7BC5Ww0uo6BYOkjwfdMGKObq3apIJHDuXIGiWJWXqPeerJcWisO7Jwe8H66650Q0paRUPVJhn19w1JxIMR6GNyYE7aV3sMbYmXT8Py+w9SemFMawq6AVYYsHtYHXVY0QV7HIfdXIVuO7pSEnpzRkabYvZ5AXTTwCDp94OgxhLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=5bIKXOMa; arc=none smtp.client-ip=57.103.86.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="5bIKXOMa"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-15 (Postfix) with ESMTPS id DF6971800214;
	Wed, 28 Jan 2026 11:52:16 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769601139; x=1772193139; bh=xJMnhPnxsOTqVbnqtxaxu3JPsxX/ROIvGxS1rJm3m4U=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=5bIKXOMagyQzjjcAzUFwjERei6B/w8FKHoZWUHvW381HfDiJ9CHbB/vC8BvbrcgMcENiQ/0ytgsOOV+EnaUGKhr8GccDMqUj/bdNCWEZNb2UVm+A/VOnVfhuw8Rt4AkNFPpiMZpJrBrIREiWQFkbUdnPBu3sKyN5zx1AAWCkBbD/E1uyVosDbktgeMsL54sAQ5Kg85NSwBDmp+dtRvCGY4hWBJ/uqtgv74bL3JHQhxcdcFmqOOFDhQarZtgnG3WYrORQDnifO8vsIX5dDQcnRuHebCXFJmyQ9zL4lmk00WDXxNREI6IGrXZ3RbPuYEQBXd0x69HgBijpURWvjJQnog==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-15 (Postfix) with ESMTPSA id 9FCD91800147;
	Wed, 28 Jan 2026 11:52:13 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 0/2] rust: sync: Add AtomicFlag type
Date: Wed, 28 Jan 2026 20:51:58 +0900
Message-ID: <20260128115200.3820113-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W_R3rExX1R9Obx5SKRc6akYZbkIgEzpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX14IK0aZXCvnd
 YtbF85q33Thkp/ggwm2RgN/HPdzLCxRp2grlV3HlL6z7Yqu1+13jFQ64BKb09PG/Yvgv0q8Mtee
 9jSsdJe7c3KRzggnnmOfmdsUfv3AyuS6NRSTf64t+6dktdrn0agg7J9/Jr1W5Z+llTqkpA4fB+h
 FDbikwFxZ7+y2GKVDJoO+Temw3Zg2H8+WRzh0O9umKSlv80cXSgohyHXUexL5xX4HWRHPHnD3Aa
 csZogvasUnqLt8ZNjmmI7Fs8PxdMpRkEzlf0NmVBVyOdWcE2l45csVfHgqNWtRJPLv0Pzq1HKDH
 xFLVGwFJVMEiYhkjbBir5B3zy4vfXovIcfWbAaFzds84YyCsoy0rqTHeXOsXJs=
X-Proofpoint-GUID: W_R3rExX1R9Obx5SKRc6akYZbkIgEzpp
X-Authority-Info-Out: v=2.4 cv=R9AO2NRX c=1 sm=1 tr=0 ts=6979f872
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=ena4uqGln5_Ct1VSX3UA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 malwarescore=0 clxscore=1030 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=489 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280097
X-JNJ: AAAAAAABRx95LmQlz0h15ruVsGzGrRfkz2gX3u9vn4FJQg5uVMl8OgqbRZazBo5jTqyGFCMSfSlZRycwmf7bROVx+PrqpVBg41ixZWmSNkEYFPd666Psd0iYawkLJIG3Hv2k/HKZO6aK2nmrZ763IZZt1MFvjZOBh4aJTjJBqmUSXTsLr27vZTMe+pW4ZuMLG/RE6biPlmmgzuIjkx1zxBRxdbOT/rXYxRVdLo670IGxHobvEiRgz9zg5nPtGLxsa7e8dHb63Cd8klAgmdVsBf/xVgRZOqSvsz9PlJVfhNa8f5H+wXz/sDhcFIiWXybPQWH6XsreTOauFaAToYJtGwQnDTToE2p4UsL75CJGHAfF2LTGrW+5hx5FyCVDpKHVJG906qstEWptk6VZ000gY4CjmtP6y/4ESXhal/X7A6OdI5CqHT30bIYZIsj7ZN1+8V8kjEd1qnRG6Y4g18g3cofXpGT9fS4W1ql9uv1K8wrEF8XqiPggpANF+gcdQIxbN/2+LIdhcE3GAueppEKDR2dlmmzVVzN7RxHsiuQDgEMD4LQ9xurDSiKl2eFtMicYoqpRN7s0H5pFxVyXTA+bXuXiEBRRdIHY9hl7a35CpTGphnaPA/mlW7NHyrixa0a8rnSik76yIq94PwLU5FCWjJaYDITe0KPfiYj7LmWEnZidVN3bf5BDGYWQKuGOWMV3kWkW3GrFNSUSGYTujKZI61XYrtWte3xpbqAyQGLn+l9KGBchXaKJ/4wTLrXnbzPDQtZWIy1S+YRucm+k7lhpudRp

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This series adds AtomicFlag and switches the list atomic tracker to
use it.

Unlike the previous design, we avoid exposing Atomic<Flag> and always
use AtomicFlag.

FUJITA Tomonori (2):
  rust: sync: atomic: Add perfromance-optimal Flag type for atomic
    booleans
  rust: list: Use AtomicFlag in AtomicTracker

 rust/kernel/list/arc.rs              |   8 +-
 rust/kernel/sync/atomic.rs           | 121 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs |  17 ++++
 3 files changed, 142 insertions(+), 4 deletions(-)


base-commit: 6583920e15fc567109e1c64ca58c917f52f40736
-- 
2.43.0

