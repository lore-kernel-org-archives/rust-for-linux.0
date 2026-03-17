Received: from outbound.pv.icloud.com (pv-2001g-snip4-11.eps.apple.com [57.103.64.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449773E7154
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759007; cv=none; b=TrMfpnGiApSbFnrSN7wguRZKIzRv3ARzFhVCf3om1QKegd+mKAfKGsofgAtUOgenWHdidsoUVyIdHW8fufd8/wiodrOi635tQfrQwdi/+g16Xx9gm5DnEaeqlA+Opp1EKEJttoPwA6mWjQmkTWgqrvYjf7fkql3Vr6fj7RSUfOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759007; c=relaxed/simple;
	bh=4rkT3E7kb/NZ3ozqAly5/4Mh2yJYqScNEhii+l4mg8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GQSBf3CwQiqmAVNauD7vBXgESdTf2jRJ1fLDqncIQrpS+WnWYPZoRylyiJK8kVL6Or5uQsWok/Utb88SpI5LNIG9Ca1vizb+tcrWLTzpHhPZvFNhg/KXA7Oe0Mt2YLdF0fLgPL70hg6sYwD4Sp+wH1owkcbeOxTXLdKxlT0cW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=rC54YlVo; arc=none smtp.client-ip=57.103.64.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="rC54YlVo"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id C788C1800114;
	Tue, 17 Mar 2026 14:50:03 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773759005; x=1776351005; bh=gFsErOyF7Do+kFZ2BWvF81EOoTXiwuGmy567W270+/U=; h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme; b=rC54YlVoy1pZulU5OMJJW6YSxLuOk2RWwP1cN/tJwD2FbWRib2gXyEqyXm4wk4MPgpCtfPA7AHLsv+NtMUy3cV3EHOC/U1MHvXv/SMJr8ixda3PgQp15S13AFg/UOnV8ohBRe+iqpwZB5feCwGlToKxgsHWUmBAFm/u2OXElNMyFOqSeWmIfT31dt8TAs2/ASkdK6ultpdJwl8lvoqg+gMDOZdNFCCpyOtXnVYJ2WtWvUMA9zM1cfmsrXG1u6TPiUDH4pE5gBylAIgFElu4fPbOSei8qtklk5Ai08vS1X7YFf1gBoStw8gHoSEFMIpvJjv/tyrH8TWwm+zVEJbw0iA==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 3025A180025A;
	Tue, 17 Mar 2026 14:49:58 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Subject: [PATCH v3 0/6] rust_binder: add and wire Binder tracepoints
Date: Tue, 17 Mar 2026 17:49:41 +0300
Message-Id: <20260317-rust-binder-trace-v3-0-6fae4fbcf637@sdhn.cc>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0JmbU3bEWhdeQ/jAtpRuilmio2Gc
 HcLKxbG5fvJe3+GRBwowbmagSmHFMZYAA8VuKGLDxLBFwYtdSNRtoJfaRJ9iJ5YTNw5Eg6pP1m
 rjKceivdkuof31rzeCg8hTSN/tous1vVfLSshRU0StUHXUI2X5Id4dA7WVtZ73/zydfEtoWmw7
 bSyO39Zli/6jEdV8AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=4rkT3E7kb/NZ3ozqAly5/4Mh2yJYqScNEhii+l4mg8Y=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJk7s8RuROjHhH1ZMvm37xW/vo4bYczSVoKv9dJ3JFkmM
 cm2nXzWUcrCIMbFICumyPL8vPfRgz9umJ05v/cUzBxWJpAhDFycAjCR/j+MDN9iDsyuWS+wIt+Y
 6UyGRknBzGudpmlnmRuNzBROa7ZbP2P4K6b7/FvXSiYWzX2l5S2Ks/VtHFRcsuStbORrcvgjPV/
 xAwA=
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-ORIG-GUID: E8Kw3nW83NHZKPI6_-MgWIDESsPyfPFs
X-Proofpoint-GUID: E8Kw3nW83NHZKPI6_-MgWIDESsPyfPFs
X-Authority-Info-Out: v=2.4 cv=KuNAGGWN c=1 sm=1 tr=0 ts=69b96a1d
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=uSVDrTZ-1OpmkelNMGkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfX6YzMsb3nnMD8
 FV4XWu5EMTRx7AW01pETF8Au/eIZn7UjveAaxQEsVpJDTxu77aV2Xuf9vYTrGzyF5CRINmWeTg6
 nC7hTKdic/uFAOsqptChffEjvOqEhYOdJL5Y+3xWBFsNhgZR9qA9+1qtxgJ8IuD46x/Ij/64N7s
 5YADhqGWcKvoMzoQesAEQ9s38fmWcE4WmToRDsskbotIZYpQPuMP89P3aLubHnx2wYL2oxwkAmK
 E0ydVhoNTPQssR4QucnXZqdISMbfHKuB5d6zAirzx14097uwB0bNv6H8LzLQX+cbDjWYMJDu94c
 ibTPnJiFUvF9u6tU+8t+hXHdklCj9QcHd1DcvO8/SZBfPHbZNhA4X0P7UtZfq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=873
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1030 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170131

This series adds several missing tracepoints for the Rust Binder
implementation (equivalent to ones already present in C binder)
and wires them into the relevant execution paths.

The first patch adjusts current naming to match the existing userspace
expectationse (e.g. `rust_binder_ioctl` -> `binder_ioctl`).

The rest of the patches each add declarations for a separate
tracepoint category and wire in their calls into the corresponding
Binder execution paths.

Tracepoints added include:
- ioctl entry/exit (`binder_ioctl`, `binder_ioctl_done`)
- command parsing and return writes (`binder_command`,
  `binder_return`)
- read/write completion (`binder_read_done`, `binder_write_done`)
- wait (`binder_wait_for_work`)
- transaction (`binder_transaction_received`)
- fd translation (`binder_transaction_fd_{send,recv}`)

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
Changes in v3:
- Reworked series to split by each tracepoint category instead of one
  commit for all declarations and one for all calls
- Dropped unneeded buffer/page lifecycle tracepoints
- No functional changes from v2, except the removal of buffer/page
  lifecycle tracepoints
- Link to v2: https://lore.kernel.org/r/20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc

Changes in v2:
- Fixed broken formatting artifacts (rustfmtcheck passes now)
- Link to v1: https://lore.kernel.org/r/20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc

---
Mohamad Alsadhan (6):
      rust_binder: remove "rust_" prefix from tracepoints
      rust_binder: add ioctl/read/write done tracepoints
      rust_binder: add `wait_for_work` tracepoint
      rust_binder: add `transaction_received` tracepoint
      rust_binder: add fd translation tracepoints
      rust_binder: add `command`/`return` tracepoints

 drivers/android/binder/allocation.rs        |   1 +
 drivers/android/binder/process.rs           |   7 +-
 drivers/android/binder/rust_binder.h        |   5 ++
 drivers/android/binder/rust_binder_events.h | 121 +++++++++++++++++++++++++++-
 drivers/android/binder/rust_binder_main.rs  |   1 +
 drivers/android/binder/thread.rs            |  15 +++-
 drivers/android/binder/trace.rs             |  78 ++++++++++++++++--
 drivers/android/binder/transaction.rs       |   2 +
 8 files changed, 219 insertions(+), 11 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260307-rust-binder-trace-c3eb49918deb

Best regards,
-- 
Mohamad Alsadhan <mo@sdhn.cc>

