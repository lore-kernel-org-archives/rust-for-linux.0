Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20A2F6927;
	Fri, 20 Feb 2026 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771574802; cv=none; b=Qsxx2adPhvGyVZYqPb3z7GqXN31VoK8UcVrsJvGK+BV0MRx2q2kiecdD8pa8auv/lzeZfMh1dlaK4NFJwe3XbEepGAWHlS+EvMPJKFImpY1kOcwwvPvNy9VBaQT75CAhD7lX4O4cR5g0FHTJWHmdTb9cGjF8rHDnJqFYpLt/Mu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771574802; c=relaxed/simple;
	bh=oh7ovVTPXi3INDBhW35BsZCibXB0g/u1OgpzR9VgEXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jNUFHq2lx2mEwPxRVtgyI7JDEwzUu0uBHcXHlmMvtBg7r7EifCsiYy/APzW923YA0Ev2ZqtFe8wTHcSGEfhNGm+7DRraNBu3ox1VROPFnaN9me9n2v59rLmGXuS/UkudbeOmpupwAA/iAurljvWp59JHUXomDNscME3bFR55kcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZycM0s64; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZycM0s64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E92FC116C6;
	Fri, 20 Feb 2026 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771574802;
	bh=oh7ovVTPXi3INDBhW35BsZCibXB0g/u1OgpzR9VgEXY=;
	h=From:Subject:Date:To:Cc:From;
	b=ZycM0s64PegXW4ntR4QwRyLf1Cua9f3tnCFzmtv0XmAzv1QEgdJmtI+aa4n9A+eZd
	 s2dAYl3zNGG06z5RfnmEM87jhsYRxDhfieOFqcutC2HjHHZmI6EvEdCRWk1CD6QMZx
	 KiqxjpJ413aE93uTpktk7eu7ThpEjYT8p+wNYeCV6BoZ6SHCoq+b3Yi3TeTlZ5nEoK
	 a/ikTjKiRbRXMBYC4bITcETT1eCz52ZOsPNAq/eWiXWY3By/7fScHdrZKVBOswXWSR
	 tg1/dNocmEhZTZNhvo9zHlK+QfReGjV/Rnyl1tP/J88PSsbrsnVxr7C7eiY7QNmw/4
	 gGGaZzL1H7ZkA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v3 0/3] rust: atomic: add `fetch_sub` and update docs
Date: Fri, 20 Feb 2026 09:06:19 +0100
Message-Id: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPsVmGkC/22MSwrCMBQAryJv7ZPkibFx5T3ERb5tUBtJalBK7
 27ajRRczsDMCNml4DKcNiMkV0IOsa+w327AdKpvHQZbGYiRYJwaVEN8BIP5pZG85wcpyHpOUIN
 ncj68l9nlWrkLeYjps7wLn+3fTeHI0TdGKG20ZuJ4vrnUu/suphbmT6FfS1yuWkKGjbZSGmU9C
 btqp2n6AodhKtThAAAA
X-Change-ID: 20260128-atomic-sub-2ff15962df12
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=oh7ovVTPXi3INDBhW35BsZCibXB0g/u1OgpzR9VgEXY=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpmBX93KiPJhPiw/vaSeYXethKoU6bfx9piMDMf
 KRfeo6zzEuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZgV/QAKCRDhuBo+eShj
 d/uJD/9c7ARgX7m/l+q1AYKSMf1DCRcXtVWySSsQQU0op85D4E5gy4xQ5T13AQlC3BLcyC7hIsp
 e8GjnclSx3h/i0BVVau0/lr8McGxxzTOuJ4zypKfNVC15f5f4knfjFmPxMZuPYRZEh58tNkgPyn
 BubmynwCUc15OKzkxelyfOOTCKtSN/0IQDKe8Xk1Fs0cgMx2HOHyLGL9NIxa/xOEg9LU+R+KG8O
 6J2iTNxZoLL+hDZgQ2iWCDgGjTmxe/FKe96AMHqNBKnjXZbi7HMgPZhrsGblrB/pX7ZqYHeTgAa
 nKYmuOMxs8c5LpZXR38IIm6oQQgqUbtxl2EUDwNuM5quQrNG+uaexcmZOIW3x1EUuPPUbGoi+om
 gnZktPIMNbjwxOr7SvFKPrbiVRi2AaVxKUXn4+7KsKJHQrPlwtuMnCBofVLKqXMlYemAShSgxOu
 kNzuuZkLo+np6a/Lncqq6Tz38EfJUTvfwKnk8mdbr/Do+hwd0MSxneelMKSdNz0ojGkIWHYxVYh
 sPnhIfZpfw1RzNKRjq4okq0IteQ/akNAQqGweq3nmj70ubl3fu+GFTVyFZTWm/z7ypfAvr3UxZ3
 ekOw4J9n2TtIqrb5KCdtsytvBGZsOmNQbTNVG8RhMhPaRO/90vBUSVhW0R7Jfe+oAxFuifUj7kv
 nbA+r9Hv8AAouaw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `fetch_sub` and improve documentation and safety comments of of
`fetch_add`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Remove a spurious line feed.
- Add a patch to update a safety comment for `fetch_add`.
- Update safety comment in `fetch_sub` implementation.
- Link to v2: https://msgid.link/20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org

Changes in v2:
- Update example to be more clear.
- Add a patch that updates documentation for `fetch_add`.
- Link to v1: https://lore.kernel.org/r/20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org

---
Andreas Hindborg (3):
      rust: atomic: add fetch_sub
      rust: atomic: update documentation for `fetch_add`
      rust: atomic: update a safety comment in impl of `fetch_add`

 rust/kernel/sync/atomic.rs          | 53 ++++++++++++++++++++++++++++++++-----
 rust/kernel/sync/atomic/internal.rs |  7 ++++-
 2 files changed, 53 insertions(+), 7 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-atomic-sub-2ff15962df12

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


