Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9894726FA77;
	Thu,  1 Jan 2026 20:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767299193; cv=pass; b=LrvC9pt/+zORQAV1Ar2wr/UdFdIDJEwpEptN9wiIClmZt5rWTLlBlRH8ZKqsgXVY4AXfZEIx205IF9Krj/ttSJozNg6YV7Vak7oVpIij7fIQ6CuXe2u4KD3XnOEAeK1p/pQAkWHZxRTAudPPiDfo55JzUmG8gXZ9VU4DUmE7ep4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767299193; c=relaxed/simple;
	bh=zDQF2ujPCDftO+Kxs6ZulPvOuqPpoxfcz/j9dFFHDOI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Yp/ppyKOx3aJAu0vltWaQtHwEVjTEm4T/5+bQ/GvuZYxlUxyBOlUVmzlVAExBmzIXViiE2LzdpTQ7VsxmT9QzlH5dT1V6c4uw0E9yNFO9eYWaFd1ob/ttmknLSVSRe0ZZ4Odn5pjIyzuTiG0GbhUFAEpE6vDl8BYpmWaH9Rmjjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=SGAriYNt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="SGAriYNt"
ARC-Seal: i=1; a=rsa-sha256; t=1767299172; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mj4C/YB7W0DYParqCkR3UeyYmUiv75I9//3F0Tl0byKMRzeaaYWuiESYbqDqMU1soNtXjah9xllkbWJC/FQU7F4M1FA8rl22Jp3JhqADqrGLG5MBpS1S4JLgu/qRLl8YlkEG7/k3OiXEMiRN1IasoRYTpgYpI1anumO09ccz+vw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767299172; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zDQF2ujPCDftO+Kxs6ZulPvOuqPpoxfcz/j9dFFHDOI=; 
	b=YB0W7ZbMdhoqFCnSjTdWJuCzaaTRSZ5M9N0ihJq7NUXZr8aBr/dT3rEicy7cLXFIP/sR5+lF6N3RIRhof1bH1B+LOY1rI675GGSeSJrqsVNWGEphrLQ3ECAbuxvVzhDsgHNxQO/d2cOeCfwh9i6G0viVmPkXhiXSabB2vufGxaY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767299172;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=zDQF2ujPCDftO+Kxs6ZulPvOuqPpoxfcz/j9dFFHDOI=;
	b=SGAriYNtP9gXk9m/sd72UaUBX4aVcuK8FVeQzpADSicWMHrrnfoCgyDHNj99/ri5
	rZ1yy5M5HnOVQvqI1NT4tsFbnkai9B/uZemD0cQCv41kvkhdMucdQfX3bYDugL+pPZ9
	SeiID+ICwrY0EBeTnobHz/4X64haKPTolY55KBfI=
Received: by mx.zohomail.com with SMTPS id 1767299170235102.60306420261486;
	Thu, 1 Jan 2026 12:26:10 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
Date: Thu, 1 Jan 2026 17:25:53 -0300
Message-Id: <60979D7D-FCC5-4B2C-870F-10C6C5596BB0@collabora.com>
References: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Filipe Xavier <felipeaggger@gmail.com>
In-Reply-To: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
To: Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: iPhone Mail (23C55)
X-ZohoMailClient: External


Filipe, you need to pick up tags when sending new versions. If you=E2=80=99r=
e using b4, you can just do =E2=80=9Cb4 trailers -u=E2=80=9D=20

You missed my r-b from v6.

=E2=80=94 Daniel=

