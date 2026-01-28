Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3A178372
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769643919; cv=none; b=Pe+w3dfVCL/bPFspR1z1GZKJzyelwrlVhgn99aXdzBHt7bbOBqxUr4S65WrE63tLbSplMbxtjFEIe8l3bpwSgaj5X/XeZ49606NRayLsFTOhv7gBd5isuPixen+1cpI1tT2Bdj+lBJyDJob26OHWZcZOIh0TduF1/yKmAitaYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769643919; c=relaxed/simple;
	bh=D8IHOpzdpv4jpNHqY+5RxyIP01Gxc9I18RznU79aOOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMwRLV6boNFk1R05dYpRpipAz6ioh9oXDMcXhV2a2BIZlpOxJzdrUT9YknWr1zdHeK6DJbF8XfYJZXOzfSJQosTJM6hNssubTzmQP1+VRaL9VZjJYdZTVUG+NFwe+dENPaN6rob42CKTAbUjm4eQKfiQ/XxgzJhUmWhI8SaMP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bv/ZYJtr; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bv/ZYJtr"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5eeff7e8bb3so316568137.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 15:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769643917; x=1770248717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5K4fiuuxH7TZZ5P2nOc2at3WjKzG7Xg5l87CzajWOME=;
        b=Bv/ZYJtrvbChBP+Hnv6A389o5n4WWcaNqCbnBLaqZqkCIv0ChhTpSuIe03TdAGfJNu
         iAaysftqZBiKKLXt/19VULKeEhLAS4weDohhZ/4gLbceJruBQRFKChvaWmYDZ4bAGozo
         KzxEwA9ITck7oNAivAhbUV/q/XHXY2s0Rui9KArUBK5bXCK2uygPSBa9ww8IfYfOcg/W
         eT9EPbwo5NzlbLEQgO4TAO0FpHXZTOXmGfGos3ACxEk++c1uysSum6tLiJWW94g1gFKL
         e+qvreaFBEwlXq5LzHlXS2GZzkeJIpqH0pKhMxzkt1xW/r5e68kYK2pc3NAudmpwJCWz
         kVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769643917; x=1770248717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5K4fiuuxH7TZZ5P2nOc2at3WjKzG7Xg5l87CzajWOME=;
        b=IBg3cLMlKMLld0ZbdO/U3NBu8YMyhG7uhqjDRsEkuaTx07Vzr1O3rhAU0zOWW58919
         AmiU/aYkctJ7h1RHOc9Gvi1jNhWvELtvBfM56zRZtiUSoTddMg7S2CwzDswNX4QEGyiZ
         9ymgQUIkt7OZhRKdBw8jzbHqf+t7iWmG92XDmkopu25rP5PsLaom5Q/Yu2WWTAIZd2UV
         yo3Tg89boXa7PpFPy7ZMyT55mfNFaajTkZvF9T7C8kgUz+f0hlAkknw+cQe9uZBsesCu
         7rKKIxMqECEHwf2qT8OkYTg+T/uUTDkmpFVXvqlU38+pl2Uk/PUeAW9G4v8a5ldjBgrP
         4imQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQvEnNe0uvMXmvSrKL+s4bbE3HY646AcqnrkDT7xMrc+tfRBS4+gNg9nN/d94sUtWW6kJC7vvmz1J+wrybkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycRaayQqn6biBQny2AiScZwGrx1tobyVqvTqqqf0FtCU5QKDA4
	3Us4XjMEAxRlvKQ/qi4/Z+07lU8UN62wTzBqW6XOmyZe39UFFNGZW4mW
X-Gm-Gg: AZuq6aLkRG7xzG2K8plYnDELVh++Ei9mPKvTZYBa9c2LP+a+lwh42MF0eKLDclckVPR
	g1xu2U2ozZid4yv/87PcGHqgsYUwcya3ISe/GjVEB0wWJJnHtdnMv7W7VKuMTuNI38vNaYIY6BJ
	5uBzyexCE66xi5Lpcbo0BBFN9eYM45jCxXKOj01Eci5caSFFYB0buYAtk+YyPIzetzWdXeIE+GG
	/yhHBiCIGvk8DS8kSBLEWEC1CVPWGjhM825p6mghWUIBuqBMoeeEWlklhfARIMYHQKZ3L2GMnTK
	gYJzJY2ONJEDabUzDMYMY/hmiROeVbWop8LQQaURdTRbcgUiclzJhnB+KRleo1BVylSMJ12fESX
	7gfI6ZMV7PdIRv1lTWDGZiEVFqEpp2ekiH/vwdgHY1OJUrR5RyTjcyDnz2D/ClEjvR9w3RxaFYH
	RY52ZepRuc1ot5FvwJgYcLg/VEN71zwmtnj+FCweuGupRlMO2PpxvOp8bdG//LCqeDPEstmyfnJ
	+u2WBKzOqB85X9ZpeVMoZ8KDw==
X-Received: by 2002:a05:620a:1a9d:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c70b84a575mr922371985a.14.1769637222303;
        Wed, 28 Jan 2026 13:53:42 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711b7ba79sm256119785a.11.2026.01.28.13.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:53:41 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1F6CF4006C;
	Wed, 28 Jan 2026 16:53:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 28 Jan 2026 16:53:40 -0500
X-ME-Sender: <xms:ZIV6aTDN3a_kIhhZ2H1nxH6f1S4IEsaoD7jvSaxwzd8rl6LSb-51mQ>
    <xme:ZIV6ae8SosD5jve8mF2--YJpnqUosLSGl-UqrYYHL5uMtJwOax37zhE4LbLEByHC5
    5q6uPagmqo4og9SFtjesT3BdNHUZyL40IUwzGLfnpQ0ZD1XY-kJIQ>
X-ME-Received: <xmr:ZIV6aTXpXyuhOlbUt0kOqjc76SyB2CDqB4X_313KDtQ-9HGBSphHTqdf3S6nO0shk8Hffe0N65GYW8hB-haBf91-IlD-Fjwe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepgedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    rghrvhgvsegrnhgurhhoihgurdgtohhmpdhrtghpthhtohepthhkjhhoshesrghnughroh
    hiugdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegtmhhllhgrmhgrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:ZIV6aWtSq9qpHrQQCLvMPW4tXsR5-IUpcyz34pT40M6ooIQlQzinsw>
    <xmx:ZIV6aVzgT15Ft9tGPhtPB9RPB3-O2jEcLd8mw1a8J94NYFkJlRhxCg>
    <xmx:ZIV6aZQf-MrcPbQmQCtRNOHpqgTiVUXgSjOrz_ajV5t_gipytjSxKQ>
    <xmx:ZIV6af-eJKAoKYj_3zRswIp9N1j5joWZkNGg4ZIHbXysKfMiHTKuDA>
    <xmx:ZIV6aXYaiGDuao_kQDt-XU_ZwwaVQZB_etcPSULeJAtBgaPK8LO6zA90>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 16:53:40 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,	Danilo Krummrich <dakr@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lyude Paul <lyude@redhat.com>,	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,	Stephen Boyd <sboyd@kernel.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Tamir Duberstein <tamird@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mitchell Levy <levymitchell0@gmail.com>,	David Gow <davidgow@google.com>,
	Peter Novak <seimun018r@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 5/7] rust: sync: Completion: Replace `impl_has_work!` with `#[derive(HasField)]`
Date: Wed, 28 Jan 2026 13:53:28 -0800
Message-ID: <20260128215330.58410-6-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260128215330.58410-1-boqun.feng@gmail.com>
References: <20260128215330.58410-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`#[derive(HasField)]` offers less code and better ergnomic for defining
a struct with a Work in it. Hence replace the current usage of
`impl_has_work!()`.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/completion.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index c50012a940a3..c4af58924fe3 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -17,20 +17,18 @@
 ///
 /// ```
 /// use kernel::sync::{Arc, Completion};
-/// use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkItem};
+/// use kernel::workqueue::{self, new_work, Work, WorkItem};
 ///
+/// #[derive(HasField)]
 /// #[pin_data]
 /// struct MyTask {
 ///     #[pin]
+///     #[field]
 ///     work: Work<MyTask>,
 ///     #[pin]
 ///     done: Completion,
 /// }
 ///
-/// impl_has_work! {
-///     impl HasWork<Self> for MyTask { self.work }
-/// }
-///
 /// impl MyTask {
 ///     fn new() -> Result<Arc<Self>> {
 ///         let this = Arc::pin_init(pin_init!(MyTask {
-- 
2.50.1 (Apple Git-155)

