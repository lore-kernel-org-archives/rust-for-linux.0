Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190813BC0C
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729232; cv=none; b=Ba6CGsFXAaHfLODnrbZeN8iGk8qMccxOw3tq7OH6M7KeR9TKGIzDU9hRG83Li/9LFCKU+PisygS5AdLG75s0PcmhBtFluTSYvmzS7YiX3h3D1q2ZDi4hKMiDIGAOI+zWfvlneTjkZztLauPBYE0ywwcLpU/E+l+vPIWaJPkfV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729232; c=relaxed/simple;
	bh=EbsBsnxiyZYu5XaaZ9/9DxydvcJj9Z2FR+JCNiBEcXI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=CWNC7eTIhccOP3bVnLxqcx10ahN/li3/yuM3bDtuA8SygDEiSKdCRYfhP2rAvvnhC87MYMrnlC41PidimDL4xwfyiLwDNF3cxOM0WLk9QpTHTaPTdytUIU2Qvo92/0BtWgALJt1EAEYtF537mgewJRLNAIXkYV9MnlX1gu2plQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=NyAya/+L; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="NyAya/+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730729220; bh=slu0juvq/e2ha0f+lesCLP3XXuwwUOd5qbcc8+RG8GE=;
	h=From:To:Cc:Subject:Date;
	b=NyAya/+LTR9ebEwS7FHRrMAsR1b51FF2FFDQcVbBDK2HA/7J56Os6kCF0yTHhsEoC
	 wlOr/DuIDYghtbf+d7+sGOGHKT4jMej/M2eGKzMHEl6un+QzqU5as8D0rEyGtCjUVx
	 g095mgdr9/Q4WCwQJHLtnHvpUq1gwOB6O0yklrik=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.53.233])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 16516205; Mon, 04 Nov 2024 22:05:37 +0800
X-QQ-mid: xmsmtpt1730729137te8jdhc63
Message-ID: <tencent_7158FA617BA03510E9D525B54613DD9E7906@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLxA6U8ecw0AsxZcD3x7lbUDvujjMIJjOr1eMgIqLMEhSADAEMlh
	 0KSbofn2ZIa6wF/i3Da11Cu7OWg++Ani2IdNjDcUBn2Ad0oXEHrbVyVVNXBJl+LmWBudjHVzbStJ
	 KkQZcKrNnXmMXL4OPCdu0W8+jXzmpGhwolWf4JZjuOafI1fuw4uO+qRbd955KnJeusiEyUqsuPhf
	 4mKuiw6wTuNqbl+f/7AE4i7DKNRmevoluGshEr6Dq83QLZZX+D8lssNUR/SBafQ1LFbq3Zv6IFcI
	 EYHfM/fCmuTrheFIcs4DTK2LtzFEF60NS3CELV2OiojWxJo+Cg2UCQMfZo4qSSBdkL2FXDYtCN0l
	 kq0Fyg0raGaMQ20qkUM2hXKyWPhMaDr9uj+oATb2KZ8rw5anhvg0PweE40JQTUFwaLmlUXNdyOv9
	 6PNRCfbx0Baesnlnm0pH5HuC3s5n3EDKyT2UAAxNQtdsL7bHc9awo40ksTrL95urHP3QcF9HQ+XU
	 IhhzJfqZxpO/pYfWXV+nBIwMtWrIE9gUwg9tswhNkL7U6EjThUFu9PaJZUbP+OyHy1lyIMcLCYq8
	 qRrBKnHenT+35/X6sD/L83IsgbhSLVG0NrpHTZW53RfWw7PnoRGLnKQ4F8KVDCdUv0OOPK0191FI
	 VP1LPJVKiEn0lMAjESo5uK/PxvEvKatNbDrGws8SvAbR9hxPZer6I53G9WL0f7WvP1mtJgqNUkQ9
	 Ze71HmPIqcj4J6OFxYQNW96oQQ7ekxX0mNhoL91Sc7f2Y1olVR/Ire6UnEwuNqnVHGAtb5SbjBiC
	 DwJU4O5k+lWlf3a5EiP6LC3sly6WREbI5Cf+M+oRZfFVAPt6hIJ89nL1yI+L0pvuf2yB2/9ggUrS
	 xADKFCWK1o062gZNVy9gb3aOHFF1TXso2Dbac0k46ujDKKs61XdTfHyHCVKJ2WqoZxZfem7wo34Z
	 NzttnUThdRF2dpSGAR61DJld6cHWxvLY0KSDjDTgU7VkqWGl0zjmgTib4Fs31V6Kh3g+Q/S27UX5
	 ZOfPCV0n9KTUGj2e5t8fB8Qk9MCh94jV1U7vyZHG/rlD6fAYb9rJ48mj5ls96U7TSXJPK8zdjaJK
	 3K6xM6
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Guangbo Cui <2407018371@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Guangbo Cui <2407018371@qq.com>
Subject: [PATCH v4 0/2] rust: Implement Display and align Debug for Box
Date: Mon,  4 Nov 2024 22:05:15 +0800
X-OQ-MSGID: <20241104140514.877185-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a `Display` implementation for `Box` and updates
the `Debug` implementation to align its style with `Display` for consistency.

Changes in v4:
- Align `Debug` implementation with `Display`
- Link to v3: https://lore.kernel.org/rust-for-linux/tencent_CC0134B8E94CCD93D347DAB9ACAB48652F09@qq.com
Changes in v3:
- Update `fmt` implementation to clarify that it does not call itself infinitely.
- Link to v2: https://lore.kernel.org/rust-for-linux/tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com
Changes in v2:
- Add missing tag: Suggested-by.
- Update the patch title and the changelogs.
- Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com

Guangbo Cui (2):
  rust: Implement Display for Box
  rust: align Debug implementation for Box with Display

 rust/kernel/alloc/kbox.rs | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1

