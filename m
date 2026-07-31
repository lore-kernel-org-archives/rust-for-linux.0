Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF538F251
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529870; cv=none; b=ibh3JFM3FrBeP5HXZBnge5uKfJtzPif057X3b4Lif06NsHFX6GMAxsfPCNy3v+fN3tlOHs52BUclT209QBvC33elRHBjCtGWkOO/THWMRZBi3DMXv7JU5u7BU09fTO6JKaY7/6KkbsX4AJWdReSBrqm5JSahIBajJz5BZLqM0VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529870; c=relaxed/simple;
	bh=l03Un0caKINAvj1iVlE/sOliFO+j6NY979CM/DpkRIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/2udv/469dHnNnw9PlJn6y7iPTjlcue4RmQvhTd+SkzL7ppXJ55AdmXIlAV0uNcAaHFJs3zuFRdYc5VfwQUGvU90bNFUKaaluVfxNaN9DQZ/OG0+gmguZvuab3GOSrn8R+y9wJA/NdqbJGxKOd/SEzsldL+DG+67leLWfJJ6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJbjHWpj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJbjHWpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A996E1F00AC4;
	Fri, 31 Jul 2026 20:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529869;
	bh=WesjdpTDaGBH3ilY8RyXNXpARBP2O1BbBYtfR/J5ZFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DJbjHWpjef8xKnQx2e6qzhCWW8YiQTgkLRwerQBWsP8eEmiTpEqBfo8MnNZTj4CVl
	 SfxWuApV5SipfSX05XtmoEAJjkalpLtoHCPjSR153zIbU+lNZYUVgl0ImzvxHm6rcZ
	 c/D8hnxmLnoup6/LOoCrzjxreCIbQLii878cLUpCoCkarM/jw/V3fnX1tixjYzzdZY
	 wTzRILCj2W7wSF5O7JYwQwSpnOjmFMe4VWxS7dEX+Yh2LHlZ6kNh1bsfABEm4RYTVO
	 FfWiLIyFPc3PMwweVP8paJwC1gR3+5rJTNUZWbx989/P3H/4JrH3gwNO79F2rJQvKr
	 SHSVBvy7jZT1w==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id D8D4AF4007B;
	Fri, 31 Jul 2026 16:31:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:31:07 -0400
X-ME-Sender: <xms:CwZtavcm1HPKhNvmmc5ExkSym_DTBZeys7zeDcQ9yt7vrFdZK28H0Q>
    <xme:CwZtavmVP5FIkwc1Y9eEvKT7tbxZpP6K8ww1MJZHlJ0vYf4j-vVDaJqJJdQzoczBR
    _urUt-MIObvw2YKkJLTAAnLU2SI8yZZaxRrqY0fNha60-PeMqvG0tY>
X-ME-Received: <xmr:CwZtauowI9UMiGws9vAdn8eKQaYiy5wQFfhLMafGqZpxnejMVxjeS3f5YNuWl470kwWGCjxEZa5IrjU2sOxXbLCAEeqWrwif>
X-ME-Proxy-Cause: dmFkZTGcyIDgVOSf66q7sFNbNg6dhONC3pWEknHmR0ZDERyZUv02pF47PwtWMGHF/GCBjs
    z8BQ3yI+0zTbDVWXZCeuTrRzOL8fR/milpuDWnN1rI1rwcGVW4BxbmsCmf2KzA1TqOz0wR
    bejBL0O9zByiVv82ITvuC1hg+yxRC4wfS/0M6cf2PIQvqrx6+cDFmfbR2mt1VblliMIbG0
    nfi6RHbRCNvvdj5grRsIArMGlRRAahBOU3g8lasFtoOMQxo3Y110eVl0Gppq5OUcHq7NMN
    IPfg7+7sDGuhtw3rxYX1WQjsOYaZ4suTKpOwpQO5Cg5VyIkond9V3yhPCyyK5zuX7QbxXe
    aD6snuB5k5zwL7LcyMQRBuyE2Hg4ZyFnoeCTOe8WAslocaH1LJI7rg8Za8d9rc34FOvwAo
    eiJzOopW+JLSOSq4uvr6j0fI5PIwSMcrB+CVfZRANtXNFaVNRs3eSeiel9tr9zUUKzzW5n
    7R9mcJADXp3iV72H2ZozUoS1eVp6NcKlpZ7kvBDvFaWk9gUAfxE5lZh5rQGJl6pkB9zvvc
    Qbnk0aCVpF+z/nnn0JG9WVALfAcApyIF5qvQ1IMBTflUdx11Zpz4payIr1VY7Nz21Hy4dW
    j/9u9jYhkGJBKClFRBCE1hJyuaTI9BX8wHNRmfRrCgTK/gVxLo5voq9pGxTw
X-ME-Proxy: <xmx:CwZtasEzDX09IaLteWs65CCT8qahBnyuCr1vUiVoe-R6AqJfojSgVA>
    <xmx:CwZtakR0NcOVuR1a8SxNj_2GlQyc1gN8TnebKtwajQ6NvuieEpFRGA>
    <xmx:CwZtaiMMkn7p648wgG_OW-mdODTSIhSJ4xuVSv2RZASbV3mVPaSEkQ>
    <xmx:CwZtahkNPga4MjdjVvDQuP8tz3OOEmp5VytiZnA6cli-tYT0l-yWhA>
    <xmx:CwZtakbZzX8XFjkn08ha7tWa0ZKRVOQg7G1KN5SMhxmSvZgVHnjOIuk->
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:07 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 19/24] rust: sync: Add abstraction for synchronize_rcu()
Date: Fri, 31 Jul 2026 13:30:20 -0700
Message-ID: <20260731203031.13679-20-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philipp Stanner <phasta@kernel.org>

synchronize_rcu() is a frequently used C function which is always safe
to be called.

Add a safe abstraction for synchronize_rcu().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Onur Özkan <work@onurozkan.dev>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
[boqun: Fix rustdoc reported by kernel test robot <lkp@intel.com>]
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260624150704.1504001-3-phasta@kernel.org
---
 rust/kernel/sync/rcu.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index a32bef6e490b..d867240be736 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -50,3 +50,19 @@ fn drop(&mut self) {
 pub fn read_lock() -> Guard {
     Guard::new()
 }
+
+/// Wait for one RCU grace period.
+///
+/// Waits for all RCU read-side critical sections (such as those established by
+/// a [`Guard`]) at the moment of the function call to finish.
+///
+/// Does not prevent new read-side critical sections from starting, which may
+/// begin and run while this call is blocking.
+///
+/// Note that this is one of the RCU primitives which must not be called in
+/// atomic context.
+#[inline]
+pub fn synchronize_rcu() {
+    // SAFETY: `synchronize_rcu()` is always safe to be called from process context.
+    unsafe { bindings::synchronize_rcu() };
+}
-- 
2.50.1 (Apple Git-155)

