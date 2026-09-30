Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD8646EC66;
	Wed, 30 Sep 2026 22:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806479; cv=pass; b=Gl1lCvJNtR3Yz8lgQBXtIR35St1a4bz0GwvQSudA4io5R+l3MOdJH8mGnOoLQ1WKPxzxl5DgzYdi3nHcSGHNB7xq0wMjv8/oiGIASDmQjI8Hh7AVuNdz6QNGEQKHh2v5sHIklGAmngHwbwnvXDVQoG252sEnxxjkBVB2xOQB8PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806479; c=relaxed/simple;
	bh=TdRUkVzrNS3ku3WjWU4WCQfeKQturZwGaSHBbvXUBsc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=T3SvS34GoCjlUjTNETTWA4+Lv1Kp4J1Pfzc3BesDA3nAU8g+a6F6wJHsA1VH6AN8vP6Aewva8x8NAHVIcrKkByIVKQ/ioS9q+PMIFwD+ocb+nkZpUYjmATDoWzl8Z7mYf0IX8stVyT7/6UxalGN2c9QaZAU8xtrsnkRrzoXLlvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=UP3Vx+G2; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UP3Vx+G2"
ARC-Seal: i=1; a=rsa-sha256; t=1790806416; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R0rhfdejG1NpLJEfeA9SsbtEXoVD9oTYmVIspiW8SSA/sSY4AQvud3VTAvEoCJZwCsREvpq/2vD0uk6PkGbXsvjQWuHVkCyFqc354FftZeX2448AI/x6Ivf5FuFvE3cw616kQrwd0CIhzIsOW09X2JkiFFbLrkDb8qqHFjUEDz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790806416; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TdRUkVzrNS3ku3WjWU4WCQfeKQturZwGaSHBbvXUBsc=; 
	b=GCuRuc8KeR/NQDLEqlhXJlO9n626ppH43k+uCq/P7LeOZ7SO24w4ga8XxhPEeA6GaA0Qxou0tVZmLT5oBWwcNuFW9tajMia0tvx9hAF7CjfQtLtkZOPNho3pnY1gArrLeuH23LtSO/e4e2l/PJzP/gAi6rWld0AonyCRW1mNtHM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790806416;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=TdRUkVzrNS3ku3WjWU4WCQfeKQturZwGaSHBbvXUBsc=;
	b=UP3Vx+G2pstp23toOTjJlXLqFl61Yjv8gn7uD+vfwj0jrWQcv3M6WnU83edp0zf1
	aSnH8mGnbwO3PjQSNY5qHBWWTlvQEwhvw1RLqnKtEKzzlS6gaGwH0lL0MgkfSjyfk3A
	8nhCsYaZw5Wmfc+AOzCJcAbNu10wdRsumRQQRPp0=
Received: by smtp.zohomail.com with SMTPS id 1790806415705949.7237250024347;
	Wed, 30 Sep 2026 15:13:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v10 0/7] rust: add ww_mutex support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-1-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 19:13:19 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <21B6451E-4344-41C1-B74B-1DFAD1AA3D7D@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Onur,

Thanks for all your work on this!

This is a few releases old by now. It needs a rebase.

=E2=80=94 Daniel=
