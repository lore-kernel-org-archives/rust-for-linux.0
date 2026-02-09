Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A11D2222B2;
	Mon,  9 Feb 2026 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647963; cv=none; b=c8fLnDV6vqaCUpwRZganhXfqFo3Q35W7ewUBi/RFdDt/XjPP8MRNDcSyE/TnSN1Q82q+JveOLw5wjfCWJqP3G/gW6orp85tQPMtnjlIj4XY4vI5VBu0RME7wTPkTA+Shaks1M/kfFi5xv7uOAE726mjNoDmHMD+wmCvxZDsfwpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647963; c=relaxed/simple;
	bh=QeBXOf7iICj0Ad5qHcIJv0VhQMqjDmVdKEV04oiCJGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFL36CMtmjzyNOpaW/Xo3WSnbSA2nji4QJp/tJ9ZkpRrM/sxQ1NIzVuRJjym7mAF9lX1JsusjkRBHa3vjx6wZ4sshFaAJtr/K25WymH9/x5nWxtrAKY8WYHGNg2BNkLArDPwJS6AKJ6SZNmdbGD1nB+0mLXL2r4hpS8Qwm9xAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsCOB8hv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsCOB8hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFB5C16AAE;
	Mon,  9 Feb 2026 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647962;
	bh=QeBXOf7iICj0Ad5qHcIJv0VhQMqjDmVdKEV04oiCJGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KsCOB8hvj7Gtk4r2EvVikB0I4H7vI12YU2LI1k0BQOQnCeokh6tjUPBHt71Q9pkdZ
	 1lNhcWa9XKHUI8c1dl/BxAg8wdd4stVJralvwL6pR28PRYVYPslxkrZ/GSWS2he9TO
	 3s6rWp7/K3KEbpBykpo4f+sVpz/vyJx3w9VsV81QqTq7sd8QwFVdaTtBKw8OcFuFro
	 SedCpoe7++qniGqyVXi/+cdSI4xr69ogDjCnr0+9dBH4u/ExIVPzBsxc/7HdhrWNOY
	 rNWc5pQf3vpU61ghIg0y8I57IxpcczFGnENVCPWsW+Kt5NmWivpJPsoJbtLRJR2F3a
	 W3gCw7K8boG+g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:07 +0100
Subject: [PATCH v3 02/12] rust: xarray: add debug format for `StoreError`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-2-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=QeBXOf7iICj0Ad5qHcIJv0VhQMqjDmVdKEV04oiCJGE=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFW0J5aHNJu6sg5tbQ2bMQpjZ6diEOzfohIH
 ThYiryfIliJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxVgAKCRDhuBo+eShj
 d/aCD/9U7agBCp8sIBnhY4v7lk+rLva9/so2zOxVLJn+Ju2B2HRFE10h0Jx9KyJVbbvbeIcxgJf
 BBq2DOvK+m0c5GSw2uewYmJaqcLA4mxfaOzgtfFsA94TV0MBmp9XydMMTvx4/zRi9BeLIu7Uko3
 thaN5I1xUBYiVkhk3KlJ2BQujOvvZwmKqROn03pXpFBr0cBSKuHmFVVprzMRd7UpSMRqoBEoh60
 9+Qe1KDMDPekp0CezkJurKJK/E5uVbdwSgRRAfXonDulmT2hhARoZBe4sJ1HaUczJUNWYzs2Wjr
 XOJO7pKsDEwGnK86gnShBPj/5VQ5PqicQmpGikFIwUcDDxWSLyA6nREmK8gl+fm0Fj7JQrvX/3O
 lg7dXPMeWFMCbN0aAitSXxaxYDIZf0xaTpeiUebEO+w8BU8zlW7ICOO7UUyhYuonKEg1aLQIiyP
 kTkcIlosy5t3uXD5hYKDLQ/ZnS3GQdxjEiw1uHS3W1Zd/I6P63lvkaPI9RIZbiiD/6kmKsgp1Zm
 wRMVg4srvYx1V2/ZkDxDE4b9qqXT/jxvkzKe5OuVwK4aa/P0kEs5NIO2g2vh4t7SJE7PlHA/eVT
 EW9eLL9eROuQmExyYOAAMvWNTC5fxcPKDH6gZWBkAwjID7zizU2AD1r3Puc1cMN6sBeNrOrr1+7
 HZgrFfLb68bznRQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a `Debug` implementation for `StoreError<T>` to enable better error
reporting and debugging. The implementation only displays the `error`
field and omits the `value` field, as `T` may not implement `Debug`.

Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 88625c9abf4ef..d9762c6bef19c 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -193,6 +193,14 @@ pub struct StoreError<T> {
     pub value: T,
 }
 
+impl<T> core::fmt::Debug for StoreError<T> {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.debug_struct("StoreError")
+            .field("error", &self.error)
+            .finish()
+    }
+}
+
 impl<T> From<StoreError<T>> for Error {
     fn from(value: StoreError<T>) -> Self {
         value.error

-- 
2.51.2


