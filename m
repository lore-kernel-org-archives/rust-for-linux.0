Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E921ABCA
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Apr 2025 20:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057102; cv=none; b=ZgAoUXa4EJm94RMvgAyRFiACwrub4HBUbQy1cL23D1pM67LgseDAXAggZhNymMN5j3T+1lMN2Ii4UyfwF3oqXWtkGv3lz9abwuRLNT3MHsbyHCP9XiCwSM28ReZP7ZPpJcGa+XKPeVmxyImCo2CHgFG6ESczMeRFtnYuWEbfbyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057102; c=relaxed/simple;
	bh=18hJKywTFEkM0gOZzQKcRfmrNbB9xsGCk04ZEokD2fU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XODFKZNGjngUNgnOnPYSnLgQgPDAjaSJpDDpw+Y2eghb+6HzrGtIUP5E48mzDFY/KEBm5nYQjyS9r3LUr1cWkUkf+mhkX0V2DoG+7U7n00w19xRircJqKmT8nS34/VqeYv7dHxmv2yisQjahuFybfov9eXl2B9evIhqnc1kCGKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=H8xqiT+i; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="H8xqiT+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744057096; x=1744316296;
	bh=dUtZ53We/Jz5znXTcombtrTyjPQ+kKMwlcb2zgo8jnY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=H8xqiT+if7FWxfY3u9FCj/BHDQy2zMNyINKUceyj8cOmhbAabkOQv2owAefjsbTy2
	 /FDOOVqIs65t8eKE8PkDja/AJus7577tWqshXgsy8MBvotHX6kwkjflTUYz5k/MueX
	 A+A8vQjmAP8f9NZCxjjDcRo0SdMmq9i2cO8AqmiPU7glXo42cHu8fwJZ7k6zZBeUNy
	 WHFGG3uXcIoOIZe6j9gw1q6CqtVZ/bfam6QkqsYJsqmQGCYVi+2SdQlpcOyFrD/q5X
	 eewUynecDr9jw++RONgc4KMKPxmhR4ARecK8BH6ICvE3u2UrVjF46v7Q1g1ORkb8al
	 l2n9exCQH3S3Q==
Date: Mon, 07 Apr 2025 20:18:11 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/2] pin-init fixes
Message-ID: <20250407201755.649153-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 85f84d51ec3314d589970f4fd59cc6ef0bffc26f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sync from the upstream repository [1]. This is the first time I used my
sync script to port the patches, so if you see any issues, please let me
know. You can find the commits in my repo [2].

Just two small patches fixing one issue that got overlooked, since it
was fixed at the same time the series got merged. And the other fixes a
markdown papercut that I found during review of the previous fix.

[1]: https://github.com/Rust-for-Linux/pin-init
[2]: https://github.com/y86-dev/linux/tree/pin-init-sync

Github PRs included in this sync:

* alloc: restrict `impl ZeroableOption` for `Box` to `T: Sized`
  https://github.com/Rust-for-Linux/pin-init/pull/32

---

Miguel Ojeda (2):
  rust: pin-init: alloc: restrict `impl ZeroableOption` for `Box` to `T:
    Sized`
  rust: pin-init: use Markdown autolinks in Rust comments

 rust/pin-init/examples/pthread_mutex.rs | 2 +-
 rust/pin-init/src/alloc.rs              | 8 +++-----
 rust/pin-init/src/lib.rs                | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)


base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
--=20
2.48.1


