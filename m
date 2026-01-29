Received: from outbound.ms.icloud.com (p-west3-cluster5-host11-snip4-2.eps.apple.com [57.103.72.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A1E1EB5FD
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 12:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689596; cv=none; b=efC+sikh9/s6xuAL14saKgdYULprLIL1j8AY/TUn2EMXIStprBb7NYU6WZZDc7d7rdQdJDQ4L3lBRZsUNIQWc3C0Ib8jN7kMSI+A4aTbZXXHrmSXxmJh2agpD/r/couQ2THqCaCjzgwVzS7Px3JD2WiS4Yjyyn//V7m2iYAf0Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689596; c=relaxed/simple;
	bh=6iJ5s3gDwO1339pbgeYyaFGsq730mwdNIn/gYKoDXq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YepqrjD3caAyWP4o8hZ0MqYexITbyI0NVS0thyoCilBOyv+km0Jj5C6Mep5kvi9JRrE86Z+Yd15FTSgUlkm6KJsVRsikQhgc3wScQd1tAA1TUG50V/Pfm+C4hgqINLXWK4P2Bms0rpUvM4OI8d/9e+5xx18enVKQdg7Yo3r20VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=CIFYBexl; arc=none smtp.client-ip=57.103.72.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="CIFYBexl"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPS id 12D4118000B9;
	Thu, 29 Jan 2026 12:26:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769689593; x=1772281593; bh=6uUfym/7DO6PBewN+m4dqtqTkRY+9txZLd6822V/V28=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=CIFYBexlhHHDKdhP1GbN2LFM7+1I1K8uhdCBUJbWoV2bkwjQRCUBnawgV9SVIEaQNRnUgQ09FXmriun8+OuPxPNByX0nHqCL8sbsNB6hNzNp4xsgkXm5Jc/89sKZSOUivtJGuGngQv/G1cqcVkxkvgITMahIZrBoTfpG6FrTmCN0/plYRxsLRrtSNdtYy128vu6HSYMVY8dJbJE0kOjdaMiABr/eD3bG2nIJrgCTuhwGeUApJyMPoZgfVDSkZ2D4gqn8XV3aQ4UymNO+jGfkHId/76KbutNjBFeqIdmvOVsi+kaJYj/F2WYv284/YNkf7d2k6KDsCLknCtSqi66TgQ==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPSA id 5C4431800136;
	Thu, 29 Jan 2026 12:26:28 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: boqun@kernel.org,
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
Subject: [PATCH v2 0/2] rust: sync: Add AtomicFlag type
Date: Thu, 29 Jan 2026 21:26:20 +0900
Message-ID: <20260129122622.3896144-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4NCBTYWx0ZWRfX3kZ6WeKtXZcJ
 edCH3dLyEpMYDF01leE76kE319N5uoqGpolG4Pm3xqKXo/S2lDpqWlYiMrxrrcj8vB12tZwnCTK
 iUuVGrv68vhaJpxTrAPpmKK5Nx0MyiXcQDFpUPJ5x9dj9y3rVOB9/OZYywOz9/U1f1QgUO8+Qzq
 JLCXQSWrZEzbYkwS8CFY0cipMfpawjEJ6aSqbp23+fW9PnvYvYdJdHci2BzSB85n32x2TbYUMTx
 WUjnRlKQ5CyTr9FoFRJrmQJrWj5np7qE5w3U7rxoE1JzcKGaulNj70bZLrpT8w6Qlabp5ur86jl
 O31MPQ0PsIhOHXOW00A9uzFLvOsgGlrQJavS7C48QK2+8cXgIyPMmjEbYeISF8=
X-Authority-Info-Out: v=2.4 cv=a8c9NESF c=1 sm=1 tr=0 ts=697b51f8
 cx=c_apl:c_apl_out:c_pps a=qkKslKyYc0ctBTeLUVfTFg==:117 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=h38X0v18AAAA:8 a=pGLkceISAAAA:8
 a=z9eZMNgWrk-rEkzYJ3YA:9 a=zZCYzV9kfG8A:10 a=hjDv5vYt9AxPTMVfK17q:22
X-Proofpoint-GUID: 9Gme7e8m297Rf2USpyFhiuDxzlf1nzPp
X-Proofpoint-ORIG-GUID: 9Gme7e8m297Rf2USpyFhiuDxzlf1nzPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=330 suspectscore=0 clxscore=1030
 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290084
X-JNJ: AAAAAAABvhycuf241kJcDG3fmaT9D9JtNptGTKWO46aTVMwblHNZPU7GfHgk4XiDVyjDJAFI6QRSx7IXYjW51qmM9Krg3mV6qcXQ2llhX/6urWsr/cFO+2LuRyENoiU1Kjhok+v0+tLg6imnDcegsb6vGogcHsQuh2gsdJdJfpIV5YTIT+bxoY6ruyCAQmk2YRYxvFHWeOKDo38SZa4086oWYrmPPBzL8CpyXT0Axlnd8dOO0/6nQ53iolq6ojI67WHDBStJ7i1BUMLbahqco1odAoyYvBaX5moc2ZEMlNga06HiQLPuBPpa1+6csx0eqaCuOrsudbDyezWJaOMkNlPjFVDfpISS4pHv64N3FbGc1shDSAKnVTfWBIoXEtmFlj/uv0Wf6KFsripKGDmgMyBE4qMp5PAEoqC/2EfhIqTDIemtSToxdF6EGtFDGL0CMs8v7TxaUkorsqAy5SuclgmrJhzJkiA+r16fedmXi6qMvSAIlTmeFOvHHAi389Q1uJNJpZOWHcqbTbCVAeBPfcia4nsB2BqY5e+NXM1r123X5Q8mxQXXLL8NU9koNgkF/OwCzl+LLEVnSytbzPPPeHe+qowfgYUx70bsc6sZ3p2/30e9UKo9EoFjMgQaxy8vK+C9ri9gtlmgkUEBY8EZNMEC1PM6iLrJc5bmbn5dvs6NmbcxgWMRU8yqq2yzYIFFe6BDIyOQcPiG37oehkj9klwJEwRhFEbgluE9JAuDoK+tlnuGsJsOYmAgTImpL8bNJsxirsBUQ3B6F3kH+WffMmTkvqrNqylD46AVe+cnAbLE5w==

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This series adds AtomicFlag and switches the list atomic tracker to
use it.

Unlike the previous design, we avoid exposing Atomic<Flag> and always
use AtomicFlag.

v2:
- Drop Atomic<u8> alias; Define Flag on all architectures
- Place padding first on big endian archs
v1: https://lore.kernel.org/rust-for-linux/20260128115200.3820113-1-tomo@aliasing.net/


FUJITA Tomonori (2):
  rust: sync: atomic: Add perfromance-optimal Flag type for atomic
    booleans
  rust: list: Use AtomicFlag in AtomicTracker

 rust/kernel/list/arc.rs              |   8 +-
 rust/kernel/sync/atomic.rs           | 125 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs |  17 ++++
 3 files changed, 146 insertions(+), 4 deletions(-)


base-commit: 6583920e15fc567109e1c64ca58c917f52f40736
-- 
2.43.0

