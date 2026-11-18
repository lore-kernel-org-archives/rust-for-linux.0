Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998401;
	b=eJ91s7bBWAeZdiwn/WeWWu8wOwdDZSVKTCpPMdOWCf+wQeo+d9BIAHtkqEUYVRv3AjSI
	 xWyeQRkMk9oXLGk/JCK35ypH44/PQom6ZbigvC0I9TCN9SSNYU8JP72UTV08yVM6jr6Cm
	 DivLE0vwi5LpjDpxvcuiNsTR0YIbQmgE/X9i4epO0PBcYgJQnCLa4VjEXwjABmZwkX1yM
	 AahiVrYNmWPA/EeQ0amcl7g4EKq6PDr2T6LZm2YoJHH9QLTNXAZ+aZPMHjwunTFojUXMF
	 +FYEFIoJJEjh5WXZN7kWw80P4nKU0xN6/wnh2EIIDS+j3fXcBUsSZuStp5gNQRKoUrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998401;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GvU3eBm4VqXFv6ZXJTX7dyjSa6wshDVGRyOyFqC/3Ec=;
	b=TAl77YwvsXXv9Bto8e0bg9I4tFz/wd+Bt2TYC/o4Ciy8abJN0s7bLGEAeNPvuKwjOdYJ
	 x6dOoye2YRM2Ewn8ve9S6ADL7o8aNNBPslb9C5F6Gy7TkU5d2uNeA2ewYDDVWR+zMFqkr
	 82J79Cd/v15iAcVYK0m5jfc5MGw61S1jaZSlUQQoaJFSJiW+dYSDB/MXOLLGdCoiDX80U
	 Hx9bPCO1VgX64Y/milmOHNU10q8hTCLr0Lja6V34Tp1wBGJPZ3zjEF6PnsO80HStzpNKI
	 xJSr9lCm/UTdwpsqYPHRjDMqH80444uY6Kiriu16t10F1Gr/xxLEUBdT0AOJh2ydxug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gw+VdoPl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740260A2606;
	Wed, 18 Nov 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gw+VdoPl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794998401;
	b=ah3/5tl1DoztiRuOroUPzYBi3NpOYTF6c5yzom9VXJipW1hIoTytszftX6pp77wWCXRj
	 oht8wOuj1gIBYnlXZkfnP3nd/VkGzWsrsBYdOxWL7mojEvADDvkcObKSVS/rIjp57/Jvx
	 HcFDNHnnfD2D7KSFeW1pF76TreLQVclQO6kqgHRlaGXs9hA2HipQky+B78DWCTWGdgBKq
	 zfa4X8cwa5WbV7B9ifl8tF4QVUQcAwrFdsgF/dWC2pmXyD+WNNPmPLop1Gua0DLbT3Qpo
	 uWG3d+V/Lu+zucgiIkK0kqojRjspr8GYDqqhC1TF2LJI00eMdfvkdvG1QC16KkBmebQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794998401;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GvU3eBm4VqXFv6ZXJTX7dyjSa6wshDVGRyOyFqC/3Ec=;
	b=qRIHKkCMbGTHzM83IrHe/Kw64jctiN58YC3uYUEG5j1/n4uurwa4GH0rj9BBU4nULGJq
	 5OoV+ClHK1n6VZgiPGKaP2HjJutLOZOQg3dd05IKk5UArswQMmbfS5kAzWoxyaK4ou5iq
	 +nV62iunHr60Y54Ca1w8aLC37xAiuV6UP1DPP7JkCn6024EhSPoluFrwo4bCIeQyY3icd
	 4y7v7WIk850vfCac9ibv5/qOOVHZwjl/bzrOm6UIYxyPQ+5ILG9GA7xvUhSLDsKINjSfp
	 RByAxGnnuXRg2IHsyBL01TgIys+LpYj6heFGzU26Wb+AymEhymmdy1bT478RV9FZtyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78EFA1F000C6;
	Wed, 18 Nov 2026 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998401;
	bh=GvU3eBm4VqXFv6ZXJTX7dyjSa6wshDVGRyOyFqC/3Ec=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=gw+VdoPl4WkyTDiAjVGRB5tm6eejd9dIj111tuAalnJwFlPVdBHPx0A6fi+ikdhZ0
	 nee0A3pm8QR+tRhnGuMAR4nfAmsE92LhekTjG3JRnHiIp1ZZScx4jkxATDkK9MBA8O
	 AkYPtvy5ddePA1zb+IY9g0bLcgPwXmupxq/gSByYj9blRKYFCo0YbBHHECWGU8vu6G
	 CNaxzAhLD+fe1Qu7MGONxDBEAUrSEuo7jSbJzko+TlfT6i0U2CIldIcFbYh0QCT78O
	 16NpBWHrVBWqcQ1mZLFQpGxFBXgGWQc9oc7x1336oKyaXevua3xLeJPKJiwhXO5DGO
	 Yf0RjClUb7Mvw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0920D4ACF3;
	Wed, 18 Nov 2026 10:40:00 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 11:40:00 +0100
Subject: [PATCH] rust: pin-init: use precise lifetime capture in list
 examples
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-cleanup-pin-init-precise-capture-v1-1-60f6e06d66f6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH+A/WoC/yWNywrCQAxFf6VkbbBTtYi/Il1kYmojGod5SKH03
 53qKpzcm5MFkkSVBJdmgSgfTfq2Cm7XAE9kd0G9VYau7Xrn3Bn5KWQlYFBDNc0YorAmQaaQS6y
 zPfCRTj35boSqqfmo8+/FdfhzKv4hnDfv1vBUz30k42lblZByFHrtY0kZTeYM6/oF1uPP9KkAA
 AA=
X-Change-ID: 20261118-cleanup-pin-init-precise-capture-c03c4a56ab2f
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794998399; l=2668;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=pZ2OArFfaWdtZNLAKFk6SbDsCLyWp8PYiR1yrw5TjIM=;
 b=Jzwcy6op0gCrX18bd0HgHujuAMD6ODVeD5+qTMw9jMl8qCIlgF0rKTbCjYc2h6H/eyIFCVuMd
 DuAsZWmdZqqDQFXDZEEqumuYvJwDxhZ5ry+UDlh7g3MhN39BRMko3J3
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

The linked list insertion and mutex wait entry initializers borrow
the list they will link into. Express that dependency with precise
capturing bounds instead of using an outlives bound to capture the
list lifetime.

Precise capturing bounds are available at pin-init's minimum Rust
version of 1.82.

Suggested-by: Jesung Yang <y.j3ms.n@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1175
Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
The two examples passed on Rust 1.82 with std enabled and compiled
with std disabled. The standalone tests and doctests passed on
nightly.

OpenAI Codex assisted with the signature changes, testing and
drafting this commit message.
---
 rust/pin-init/examples/linked_list.rs | 4 ++--
 rust/pin-init/examples/mutex.rs       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/examples/linked_list.rs b/rust/pin-init/examples/linked_list.rs
index 424585fe226d..577106005cbd 100644
--- a/rust/pin-init/examples/linked_list.rs
+++ b/rust/pin-init/examples/linked_list.rs
@@ -39,7 +39,7 @@ pub fn new() -> impl PinInit<Self> {
 
     #[inline]
     #[allow(dead_code)]
-    pub fn insert_next(list: &ListHead) -> impl PinInit<Self> + '_ {
+    pub fn insert_next(list: &ListHead) -> impl PinInit<Self> + use<'_> {
         pin_init!(&this in Self {
             prev: list.next.prev().replace(unsafe { Link::new_unchecked(this)}),
             next: list.next.replace(unsafe { Link::new_unchecked(this)}),
@@ -48,7 +48,7 @@ pub fn insert_next(list: &ListHead) -> impl PinInit<Self> + '_ {
     }
 
     #[inline]
-    pub fn insert_prev(list: &ListHead) -> impl PinInit<Self> + '_ {
+    pub fn insert_prev(list: &ListHead) -> impl PinInit<Self> + use<'_> {
         pin_init!(&this in Self {
             next: list.prev.next().replace(unsafe { Link::new_unchecked(this)}),
             prev: list.prev.replace(unsafe { Link::new_unchecked(this)}),
diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index e8d4dbb664fe..81b425cbfea9 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -163,7 +163,7 @@ struct WaitEntry {
 
 impl WaitEntry {
     #[inline]
-    fn insert_new(list: &ListHead) -> impl PinInit<Self> + '_ {
+    fn insert_new(list: &ListHead) -> impl PinInit<Self> + use<'_> {
         #[cfg(feature = "std")]
         {
             pin_init!(Self {

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-cleanup-pin-init-precise-capture-c03c4a56ab2f

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


