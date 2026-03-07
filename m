Received: from outbound.mr.icloud.com (p-west2-cluster4-host5-snip4-4.eps.apple.com [57.103.69.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE833242D9
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 05:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772862154; cv=none; b=m9D3apxXEMckRVM1oZ/YMaA68lVkKhn/EETrmsNzDuJAQkqFKChCHPDUAFVX0Chkx9fMDbk3IFrl49wpjiZke3/3jSKzVdmCEjdu5O4u/It57AlTfAPJ2GKYK9djOHaBw8LKcNqKtI+7fbhgNpN7uqT4CgNdX9pQHzqhVLFP8Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772862154; c=relaxed/simple;
	bh=67PFytdQZ9K2be29zkeF/t86PfJ5z1gCNW9FDFc5LHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ok/JePhpBi/M2cgoEXuzN4o6JiXFkMAPWrfyPt0CVVW+DMbyPYGSI36E37ozdMxGL4vogpb3/K3MUFJW8aaG6RrMqKDrv1Vw6TVA4XPpwdpNtpePOKBJg1xeNADNXD3ryltqvqn3/D2eqv6F/6u0Q6LQQll8G4jm9d9PpdJ0Mx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=nqOmnAxU; arc=none smtp.client-ip=57.103.69.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="nqOmnAxU"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPS id DB7D41800178;
	Sat,  7 Mar 2026 05:42:28 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772862152; x=1775454152; bh=IB6Tbc/za3gq0YeYXEwhAihlAZ8rvc7++mCIVWs4Hgo=; h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme; b=nqOmnAxUY024nt7EgIBYB/rQwgsKmPG/EumwNx0MBtqO3iVxN1Fol9+121Tq1tsFX7Uemy1fxLVsQ9BJue76xpZjFlqGGXic2bOcOTRe42KiO8XP9ub/wgExcpND2WO5AsHUpz61nR1aeC9loBNhAggpvY+/q97eUekX+vVCJZHJzDQcbGNQF3ZmI6uMgyfT3nebFva3wpjuh7YUAbhKqGU0aNkbB0Zp3KPHnN29ZMvbnt2WiOsjm38/WyWh3CrzRwXZVZ78XDk8RN43v4BpzDphh2YFKpHOre728vopT4A4ZribkAhCggLCSdM7khn5AQ+rUbGx/aePaeMWsoOSpA==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPSA id 50ADE18000AB;
	Sat,  7 Mar 2026 05:42:24 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Subject: [PATCH 0/3] rust_binder: add and wire Binder tracepoints
Date: Sat, 07 Mar 2026 08:41:20 +0300
Message-Id: <20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNz3aLS4hLdpMy8lNQi3ZKixORU3WTj1CQTS0tDi5TUJCWgvoKi1LT
 MCrCZ0bG1tQB40RI4YwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=67PFytdQZ9K2be29zkeF/t86PfJ5z1gCNW9FDFc5LHs=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJmrd+1n1N8nvMZDlF/51ez35sUF2QWrPdZzFz65/CTm4
 QW73o8MHaUsDGJcDLJiiizPz3sfPfjjhtmZ83tPwcxhZQIZwsDFKQATKb7KyLD1/hKvmN8RzILM
 a0RY6i82hTKd3ptZ6FTA3S7v3bSrMZnhn8G33AnFS2c1Wl98tkxqp/dajsktPJ2p7xR+vnsSd6k
 3nwMA
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDA0OSBTYWx0ZWRfX0Imiv9dVO71V
 CrbCMhLr1jJs3QY687bjBeviIoO5v2jtMQq2nfc1aWYCqpCSwq0eu+7rYDRwwPh/zlLkQLIq+is
 NzkXoyS2wHMj3sBytLJz81ruZQrDv+JHyh7t03L2m94tb9zenjuhHo4/zS5wfW4H2luuTcqseQg
 ciyDGbT2hv3M6/HvZGIkyYmTTQlR4nM180j4/4SfNPyArn8YB/cgI7CTKh+Y2YZT7Et/AQqpJLc
 2xMtFR0IBQIHFIQAeSoTu/W4ByNrhLpce8O9Eb9oWy3a0i/um6JEMB3XnSx0vTEs9+mqwVXE+hJ
 Z7ZT2ssCinSiH/Iv8grLLaqQx7d/McLCjkzbo4F3FcYhUy1UZKJneR2rdHX974=
X-Proofpoint-GUID: KjI3aWR6YBF8ZTSnJPeTtp13YdNveXsh
X-Proofpoint-ORIG-GUID: KjI3aWR6YBF8ZTSnJPeTtp13YdNveXsh
X-Authority-Info-Out: v=2.4 cv=EJALElZC c=1 sm=1 tr=0 ts=69abbac6
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8 a=ebdyvmBlM_SK71_sN8oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=246
 bulkscore=0 adultscore=0 clxscore=1030 phishscore=0 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2603070049
X-JNJ: AAAAAAABwY7l9g+ADeK7QkhjfSNacms4HDoqeX2G1WvytZ5Sk19YWvj5NjTx4mJkCqmnFl5Rt8Miad6Zs9o4PpN6wwMzATFAS0J0yc13ZT8lSNbvy1lV46mV4+d2rjWfPqa5nKRWPJGbwLnfVOlEt88GDpjNcAWqCwtn99rbxMpH3fT8zDblCZCRMMm3r1FU6K5/E2ODISG4dXHAaEjuyf9w90Qi+N4x7Zvb3Pc8aQ59JDQ5wNOCe7rwthhoBOyrwOaXpNVtoAZ72TnQSux2bMZrBNQZXbdOuFddLDhekjO47Vy9VjO6+klMNNPc/DMFga0VeGO2T0XRO6mo8uwvjcLc3/niB7k1lfvy3+/8YlhzOuP2u0ziAYeQWi7gISscehcqcVH9TEUHbe7eBuIQa1gzUd+r671MXkZGZwds2qLUyLzlxoaJ/VbQ5Uw8butV0LYykA7BnjM/krzzTng3nyYIsbR4kCLJDxsCRRxu/KSo3Y3iHZcKtVCLPk5p2QMgQK+beQexwEGEC/Gm+qn+io+6gkFOqtdEAg3EiJclzmCkfthfxgxxrchCPTI8Vau8agaE61XwK1shwG7b7n0BrjloNSgauuHH5E5n5H56bZKbaObbkP+fdAgNXKmfjLeV0y5O59kD2L6oWV9r5WeyN7dVWQITWlKZ8xWMeFaCchv9l/Omkcq+ijpJ1fhOm5RRGjNgUSa31HYSiEbmFAt4ZTUp9oCW4x/wqYNursrwSupJmcvug7GjUCmW69PQ9pkOM3HI8DOp/xT5CrGiTz2b/ozMWxYzRjywgOiFzNYcKyQJLEkvXQ==

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
Mohamad Alsadhan (3):
      rust_binder: remove "rust_" prefix from tracepoints
      rust_binder: add Rust binder tracepoints
      rust_binder: add in the new tracepoint calls

 drivers/android/binder/allocation.rs        |   1 +
 drivers/android/binder/page_range.rs        |  17 +++
 drivers/android/binder/process.rs           |   7 +-
 drivers/android/binder/rust_binder.h        |  28 +++--
 drivers/android/binder/rust_binder_events.h | 176 +++++++++++++++++++++++++++-
 drivers/android/binder/rust_binder_main.rs  |   1 +
 drivers/android/binder/thread.rs            |  15 ++-
 drivers/android/binder/trace.rs             | 119 ++++++++++++++++++-
 drivers/android/binder/transaction.rs       |   2 +
 9 files changed, 344 insertions(+), 22 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260307-rust-binder-trace-c3eb49918deb

Best regards,
-- 
Mohamad Alsadhan <mo@sdhn.cc>

