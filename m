Received: from sg-1-39.ptr.blmpb.com (sg-1-39.ptr.blmpb.com [118.26.132.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805A7FBA2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761137134; cv=none; b=J2Leun+MPuNyy6CIHoquLf0rtqRXYpRrmmkM4FMm9gnASwHkB0l5os106KzY46T9qSm6H2SH1GJHEDPSQrz2L4kZsHFbwoUYVxmFQjrHAi7U0dpqZ1FrjDecQoi3gS8ianxCAo4XFVR0HyO+40Q8Un02PgVGopTqgFA/Bmyzob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761137134; c=relaxed/simple;
	bh=D9Vx9JIZQkAcYhsiNvNCoRPN+Xg3noNOUZmbe6SmdsE=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=uYIfu8XusTg0UGn+TpId5ffPloc1dociwzQq8VjqOm7q36eMqX+VZHiclkYcMTrvgeBsBoJMY3y5ilmgPLY60uaQ1P42STRLwhRkwXajS2UIYbkSg4QF4MOfcZl5+vAjlp7nChH8cxc8Wg/HFss617g8rOBNNFKYSZrSIdda9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=I0s/Uqij; arc=none smtp.client-ip=118.26.132.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="I0s/Uqij"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1761137109;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=D9Vx9JIZQkAcYhsiNvNCoRPN+Xg3noNOUZmbe6SmdsE=;
 b=I0s/UqijjANvHIREBKUkpAyQxPk3roAhNYp22fKbNCyr+Z61zxtm5lW28jgi/1dWJdCW8D
 4bnXr8pepla8baANJu2UZ4/B9JMMq/84As42boiJhT5Tq+6geDFgDheFoxIxCZ0gQ9bbp+
 VV0iC7C4b1Dp73NQCYLMavnREsFV4tnbg07zh7TfDvFQj5W8qaK5R/mbSMtYtN93xx02i3
 HWRX7M6uAYbSG8tS4sXR2/u64gGzNKHGPXI8sU5iw9g9Ah6RWwXgbkG/b2rDMNDCJ72BTg
 0GEL0ag4NNj4IeBnfLptoPR2zUaJPBLZ6zVG0AQhFK4HT9DUXRfrFVsDdm3HQg==
Date: Wed, 22 Oct 2025 20:45:07 +0800
Message-Id: <b929896b09325ffcad073edec86c3ce2048bd363.aca6009b.af09.4398.882e.a39af511d7bb@feishu.cn>
To: "rust-for-linux" <rust-for-linux@vger.kernel.org>
X-Lms-Return-Path: <lba+168f8d1d3+13f86c+vger.kernel.org+caojunze424@openatom.club>
Content-Transfer-Encoding: quoted-printable
Cc: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>, 
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>, "Gary Guo" <gary@garyguo.net>, 
	"Alex Gaynor" <alex.gaynor@gmail.com>
Subject: Inquiry about Contribution Opportunities for Rust for Linux
From: =?utf-8?q?=E6=9B=B9=E5=90=9B=E6=B3=BD?= <caojunze424@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Dear Rust for Linux Developers,
Greetings from the OpenAtom Open Source Club[1] at Huazhong University of S=
cience and Technology (HUST)!
We are an active community dedicated to promoting open-source culture and h=
ave been involved in various open-source initiatives. Our club has experien=
ce in Rust-based projects, such as leading the development of RustSBI[2](an=
 open-source firmware written in Rust, which has been adopted as a referenc=
e implementation for the RISC-V SBI specification). We also organize open-s=
ource learning programs, including a QEMU training camp[3] that has attract=
ed nearly 1,000 participants, where we incorporate content related to Rust =
in QEMU and share updates about upstream developments.
We have been following the progress of Rust for Linux with great interest a=
nd are excited about its potential. As a group with Rust expertise and enth=
usiasm for low-level systems programming, we would like to contribute to th=
e Rust for Linux project.
Could you please advise on what areas might be suitable for our team to sta=
rt with? We are particularly interested in understanding:
Current priorities or tasks where additional help would be welcomed.
Whether there are beginner-friendly issues or documentation tasks we could =
tackle.
Any specific subsystems or features where Rust implementation is being acti=
vely developed.
We are eager to align our efforts with the project=E2=80=99s goals and cont=
ribute meaningfully. Thank you for your time and guidance. We look forward =
to your suggestions and hope to collaborate with the Rust for Linux communi=
ty.
Best regards,
Cao
On behalf of the HUST OpenAtom Open Source Club

Link:

[1] HUST OpenAtom Open Source Club:
=C2=A0=C2=A0 =C2=A0 https://hust.openatom.club/news/20250812_intro_to_club/
[2] RustSBI Github Repo:
=C2=A0=C2=A0 =C2=A0 https://github.com/rustsbi/rustsbi
[3] Learning QEMU Camp:
=C2=A0=C2=A0 =C2=A0 https://opencamp.cn/qemu/camp/2025
