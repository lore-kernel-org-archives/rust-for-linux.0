Received: from outbound.pv.icloud.com (p-west1-cluster2-host11-snip4-6.eps.apple.com [57.103.64.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E823ABBF
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 01:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933161; cv=none; b=ILHMkUZ2wl2gRipYtQgdEFUoTKKm86op+0pNNFhg//7hhwgnvjGTky42sR9Nhwl1pITMIR9XBfy6rtIwSpAwz5lInfYMQAT53KQIX/mXu59oyQuuMAAwpwEK+FytJ5Qbn+WHeaaHRTJXxiKzISr+HnFp8MmH1++Cei032zDeOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933161; c=relaxed/simple;
	bh=3c9SVy0O9oGwILGtbz2cqOwap9x4hD89fcK7Os8+4ys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I/weIbNIn74GPJkjGcKSmPIRxneUQHp+3/L41NDcbSOYTg/1acvAveAE3X9gU/jy7gawzBSHiToKwH4CsXYOLQnI4C+D7kwRz1kTyxNkjlgRA6Vg/gnfOr/HDeZIwXEgTYJjjrz8HL0uLopvwOsypvjZPVa+PBf67WUA0d7aBGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=U37Hl95G; arc=none smtp.client-ip=57.103.64.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="U37Hl95G"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPS id C24E91800249;
	Sun,  8 Mar 2026 01:25:52 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772933158; x=1775525158; bh=uJYdaJwnx3I17mxbZjqsMVzofIM0VgRXVRaLyfe6Rqs=; h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme; b=U37Hl95GRQHOLA9lgYU1cL36yjE43ULj/ZOzC9p19yFNzbcQ67Pdq9OBgvO+7YwW0E+et5VOd1Z1PxZSwXbGqHj2l4+fLVIK8NML76RUTia0V+A/4mdKuxp+XU/I0mvkOnSH/rSdNMAS2K034S3qLaA2RW+yxZgdo0TcPgeLAiIvwJ8VIUAttTl41Z+/eLlP1jgOR/eFgCs7ELTrwSYo1OsvA7YJgAIvciJ3Fjv+MhZ8aCeVGzFWF0W/sA+/+x+oB2sAim7gbxonPdAV9BUrlDUZ4sbZHyXyQaVuClidsvk/qWCrM3AoScxbxc6NP55Q+io5tjEKnSgmXIL/+Ai2Og==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPSA id 857FB180027C;
	Sun,  8 Mar 2026 01:25:47 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Subject: [PATCH v2 0/3] rust_binder: add and wire Binder tracepoints
Date: Sun, 08 Mar 2026 04:24:33 +0300
Message-Id: <20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7ZjSCoIr72FYwHSU2RQzxUZDe
 ncrB3D5XvLf3yCyCke4VBsoJ4myhAL2UAHNY3gwii8M1tjWOHNGfcUVJwmeFVcdiZEcT6e+rzv
 PE5TdU/ku7715GwrPEtdFP/tFqn/2Xy3VaLBh42znqOXGXaOfw5EIhpzzF9xSe/6wAAAA
X-Change-ID: 20260307-rust-binder-trace-c3eb49918deb
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=3c9SVy0O9oGwILGtbz2cqOwap9x4hD89fcK7Os8+4ys=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJlrLkj/jP19TOlwe/ZbaRfb75v5bOxe/DoWwLJKfUdBM
 ePsor/zO0pZGMS4GGTFFFmen/c+evDHDbMz5/eegpnDygQyhIGLUwAmcnobI8P8rXftaiKMwm/e
 X3NB8G5pt+jO6EvmBTvOhlsIZNx/wOrP8D9x00fdBbF7Ne802bxeHSaUOulCoVqa0KMEi1kffIr
 t3vMBAA==
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-GUID: Jip7YZergSf4z6bzZz7FZ7y-DhWmOk3d
X-Proofpoint-ORIG-GUID: Jip7YZergSf4z6bzZz7FZ7y-DhWmOk3d
X-Authority-Info-Out: v=2.4 cv=TZObdBQh c=1 sm=1 tr=0 ts=69acd023
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=ebdyvmBlM_SK71_sN8oA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDAxMSBTYWx0ZWRfX0GDwE6UAbsL+
 xC9LdZs/mwoCSFkmGC0l5nsFoBv6LTc6npnSJPqPY2L7ti3wZHFZIQbjzvGsMLHbUCq6lYW6NRs
 7MInVmemhLg1GLFFhZHx9c/8S6lhSZRs0Z+a9IkVv07PRyePJ5AYClOe6RRbuVavwK/HOAbJllS
 gmt3XXBv6RhUyj8uKLG8VehoryuH8mNk/2zjE4xiSDFBwMbE2kdwnPigN5/EXfMNZCS/5Bt9wex
 hrSNdnysR2Abt3huHYIQmj9xR9SlMGcFt/QmdPQgxKr9WqB66WoVG/FktMLaUw0aQeOFpnx3Sap
 G87GaZEZiqVFTpqPQoqZ1DSOgfPbVBARmEXo/+l9iDoy8P1j1vulzjHpQXTCrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_08,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=500 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603080011

This series introduces tracepoints for the Rust Binder implementation
and wires them into the relevant execution paths.

The first patch adjusts current naming to match the existing userspace
expectations. The second patch adds many tracepoints that exist in
C binder but not in Rust. The final patch wires the tracepoints into
the corresponding Binder execution paths.

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
Changes in v2:
- fix broken formatting artifacts (rustfmtcheck passes now)
- Link to v1: https://lore.kernel.org/r/20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc

---
Mohamad Alsadhan (3):
      rust_binder: remove "rust_" prefix from tracepoints
      rust_binder: add Rust binder tracepoints
      rust_binder: add in the new tracepoint calls

 drivers/android/binder/allocation.rs        |   1 +
 drivers/android/binder/page_range.rs        |  17 +++
 drivers/android/binder/process.rs           |   7 +-
 drivers/android/binder/rust_binder.h        |   5 +
 drivers/android/binder/rust_binder_events.h | 176 +++++++++++++++++++++++++++-
 drivers/android/binder/rust_binder_main.rs  |   1 +
 drivers/android/binder/thread.rs            |  15 ++-
 drivers/android/binder/trace.rs             | 117 +++++++++++++++++-
 drivers/android/binder/transaction.rs       |   2 +
 9 files changed, 329 insertions(+), 12 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260307-rust-binder-trace-c3eb49918deb

Best regards,
-- 
Mohamad Alsadhan <mo@sdhn.cc>

