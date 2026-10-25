Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928618;
	b=nGGmp5sVs+RhFHe95OuxNixSjosC5ktv3/cZoV4RJkAk7FS1HiRA0AH/qjerbQ+qyhjr
	 WwJKuZJhSqlhdaDwsTH8dNnXw/O2W1BiGnvtbwFCFVFGiy4623FWjHbcw8RugP/BF+uZl
	 20tG3s4JUj9ryr/dGUzfWWPPHjrwt4o3JTMKY115uM+b3FMAn2zlu7PIXrn7dYOOfbOcT
	 vD6RYgdHkB6TfQWW+br5GmnaZSxJf4Ybr9C5eCfNcMF1hR0JlhZrSUnJX54FQHsERMOKy
	 8aSuM+zj5/SsorHgLyoQEESxInB6uK0Xwsp4wUIwCooChzdUi6YWeF89BhJVLazflBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928618;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3tU06HeQH713VNAukSgPmdsvYQlK2TSN1fZM8EM0G7s=;
	b=zHXDjOlZbo6S9GaHSkcY71F3xr4Vst+xI0c08E47+h7adV8tSdIMS+GKZD8MGJP4xDiR
	 6b4GcpQ8vj5kG+e5KqsPwB1elQ5gntBo0UFI/hb6JKTZI27mXOka5JvW/pNAxm4nkBEk6
	 Mg5Q1hNLLSQs6wSXGoWpS/A4dqkgVVVbOUL+qtwSlqG2Ir3uWPRmjJtv7roJG76fg2vGB
	 3S9noMslrefAtx959jtM8SKRwwCsE+ihNVxYqUJyTgwbRHri/cB2qlYOKxpuOdCM/x8yG
	 6x9PUHuD7FSx3ZPgbwWu7c7LB5284N8IWB4jL8aQ46Zlyh6JOzMg0JpgcnuD0pPWDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lxW+44qi;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34613606A31B
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Oct 2026 11:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34613606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lxW+44qi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792928614; x=1793187814;
	bh=3tU06HeQH713VNAukSgPmdsvYQlK2TSN1fZM8EM0G7s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lxW+44qiVhk+AGNEb3glwYMiO3rDauroZl0d27H/Fu8wsaLPfIbKdLVBjy+1SOulw
	 0WjsRcM2zhDOfH+cQQi29/RiOUpE3EMSnm9u9/6fVEWKEgXOxYrY4e5jVGh9SPvdEJ
	 5tiFvvEnl094UPdiBfYYh0jULi//7PoW6x776fYrDN8CxodybHip8nkOrI+Bi8WIvn
	 9BgVvCEYgsaUSWQTIWGEWRI76ZAAIVuk18W6sbXdccmWMXi2R0OwdOARk7U6cxvGNS
	 +QIxbmCkxlgrxC4C8vXaCNafFmnju6tUD65L9DHgSk4aA+DSHX8yiGHOuSfjqdIvxr
	 u+W6rf+h1ECuA==
Date: Sun, 25 Oct 2026 11:43:26 +0000
To: Miguel Ojeda <ojeda@kernel.org>
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Tejun Heo <tj@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH v3] rust: workqueue: fix SAFETY comment incorrectly referencing `Arc`
Message-ID: <20261025114304.16730-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 51809fdf32bafb28e4adca1eb74d3b14d000bc54
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The `WorkItemPointer` implementation for `Pin<KBox<T>>` incorrectly
references `Arc::into_raw` when `KBox::into_raw` has been used.

Fixes: 47f0dbe8fdc2 ("rust: workqueue: implement `WorkItemPointer` for poin=
ter types")
Reported-by: Onur =C3=96zkan <work@onurozkan.dev>
Closes: https://github.com/Rust-for-Linux/linux/issues/1233
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
I originally sent this patch in April but it was not merged because I messe=
d up on=20
the tags. I remembered that I failed to follow up on this while trying to r=
ead this module.

Changes in v3:=20
Fix tags.=20
Link to v2: https://lore.kernel.org/all/20260426175317.10171-1-sagartaunk2@=
gmail.com/
Link to v1: https://lore.kernel.org/all/20260425135701.34010-1-sagartaunk2@=
gmail.com/
 rust/kernel/workqueue.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..2c07785d446e 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -890,9 +890,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for P=
in<KBox<T>>
     unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
         // The `__enqueue` method always uses a `work_struct` stored in a =
`Work<T, ID>`.
         let ptr =3D ptr.cast::<Work<T, ID>>();
-        // SAFETY: This computes the pointer that `__enqueue` got from `Ar=
c::into_raw`.
+        // SAFETY: This computes the pointer that `__enqueue` got from `KB=
ox::into_raw`.
         let ptr =3D unsafe { T::work_container_of(ptr) };
-        // SAFETY: This pointer comes from `Arc::into_raw` and we've been =
given back ownership.
+        // SAFETY: This pointer comes from `KBox::into_raw` and we've been=
 given back ownership.
         let boxed =3D unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
         let pinned =3D unsafe { Pin::new_unchecked(boxed) };
--=20
2.56.0


