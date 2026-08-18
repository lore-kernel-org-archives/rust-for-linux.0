Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F743C109A;
	Tue, 18 Aug 2026 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050452; cv=none; b=bdlxnFsu4dYsXsdjmX3iqBjl3vMqZxeCWZY/zAcC1r3WcF8UuuPcywP99Ssssl/BNJNwSmvZ5V7a+x4bwFn37g3iIh1c+PiQBqta3YG1cPoaGfv4IW2fbOwNPOgUr2NLhesFsGnMfa25dybrhH28qKA3aGYbQfROP9zJaRNJx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050452; c=relaxed/simple;
	bh=yvIdYFdV09mQsIx//BhJrU7E2xu2utdt6v5XH4rqCYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8zqYLGGiqOqGv5ioQNN8DaDDFKpd/JabT61C/tePGSbDrctVB6r4bkKPbLoT8dNkMBRaVlMw027Cb2JEVURC7pvJJrReGiGLPBuYjaxHbQHTM7G8uFaZPT8yQb8Ff4UjzeAVkn0sfBkza9Pzx1gQejm/q7D/r4nFKjoPv7b5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKoJ5Y8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKoJ5Y8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE731F000E9;
	Tue, 18 Aug 2026 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050450;
	bh=NbISsIEzJhcSlB9HuGqIX+LYbp7rKI441yyyPNYbVMs=;
	h=From:To:Cc:Subject:Date;
	b=RKoJ5Y8HhCRNnHGPhL9Az5CmNhmyanFWdlQREqerBAP5IuRdrUbCVefoMd81BD8HG
	 e8hs4t9uSiBWY5mInJuZtxATuuIT6VgmMLoakYzE2I3rtVE65cUBha1Gtv+LE8DbGG
	 Uu2Io6XvSgiTj4ZO5SN39UGMxstzLqcg/MXXQguQscmqknQfm0kS9FmL3e7m3Oi51d
	 Y5O/KMH24VQTC4odopiyvFH/H4Q64p4+4b1+4ne2tOcg+KFDmnEBO5O+SyrVuphkvp
	 Pvu8APUZ0GJGKiONijXcD7HHtOLTZIPs02QRQzxaK7w1hpm07OeZCgDYX61IbZB8Xz
	 aidx6vKPMucYg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-next@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH -next] rust: fwctl: replace `__pinned_init` with `raw_try_init`
Date: Tue, 18 Aug 2026 12:53:50 +0200
Message-ID: <20260818105350.361218-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit

  ea7da3116015 ("rust: treewide: replace `__pinned_init` with `raw_[try_]init`")

from the pin-init tree replaced the method before removing it, but commit

  e052daab94ee ("rust: introduce abstractions for fwctl")

from the fwctl tree added a new use.

Thus replace that one as well to fix this error in next-20260817:

    error[E0599]: no method named `__pinned_init` found for associated type `impl pin_init::PinInit<T, error::Error>` in the current scope
       --> rust/kernel/fwctl.rs:465:49
        |
    465 |                 match T::open(device, reg_data).__pinned_init(uctx_ptr) {
        |                                                 ^^^^^^^^^^^^^ method not found in `impl pin_init::PinInit<T, error::Error>`

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/fwctl.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
index e6a8513a47d0..f29244fb0d1d 100644
--- a/rust/kernel/fwctl.rs
+++ b/rust/kernel/fwctl.rs
@@ -462,7 +462,7 @@ impl<T: Operations> VTable<T> {
         // `uctx_size`.
         unsafe {
             device.with_registration_data(|device, reg_data| {
-                match T::open(device, reg_data).__pinned_init(uctx_ptr) {
+                match pin_init::raw_try_init(uctx_ptr, T::open(device, reg_data)) {
                     Ok(()) => 0,
                     Err(e) => e.to_errno(),
                 }

base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
--
2.55.0
