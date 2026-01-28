Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295842BE03D
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769643431; cv=none; b=ANDOKXtuBIKlQpwyr3eTdyL/efEhSk1M65lybBEjS2MMivtQyOnszxRsE7L6LaTJweIhV1BapqGHR5wjhg5O0jGJP9lo/Gx/wQAe3QNBA/2XIkrzX4VWeqfFv7GWcGOcuydl2c5qjAxgF36GQoBol/9xYdc8xbQE1nv1ZKqE7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769643431; c=relaxed/simple;
	bh=1d8hvFb5TqW+gQq4qtYvC+fv837UPEdBxL2Hk07VcJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgdGXKO279/AhW3GjJVkp/m/c5NYvgj15tXNu6m2wyG02T6PByfcZXxrD9RngmajSq5FS04TkIqe1iwZ6V8Hj+m9Va/aU0ZK0KdNFjKn8/cPxyvZJXPzsFQbRMizGFwrI/mFQgL++eqxPDFYH2teTOEPtODASvjIakzmGAZ7a5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjLr0vHk; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjLr0vHk"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-409697b94bcso248631fac.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 15:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769643429; x=1770248229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+paZfars3KKP1JZVhG7KRu0fZBv7UeCEE9k0P4oMOM4=;
        b=AjLr0vHkP5iLugiyynZ+80lC8h1+zySG/eF87TbNi57IF22aOZgvSLXzd48BOo0XHZ
         Vnj8zAKyeokiD1MbzWyKMbHzysgL9kmY2zheSRcDijtJKBT4FAVanipcq9XCwA3JGlgP
         BIL5n5dIfyiPhgKEXD52HgOlct/AdDB25SO5pomSCeQ+utkxOP5KtLZWxwUo5r6NvZoA
         Ak/nVQf/ZLiVs6yW2K9afNptd1RXWV/Y4EBYwwMHST4CaDYMMZvdtQ6YNU/AHo+zHXl4
         KBcwfDpVIlble6juY2ayYY9rpT8T0Ea97918DyE3UM7PNCucGRyQrbFMvkA01GTwpnN9
         gVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769643429; x=1770248229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+paZfars3KKP1JZVhG7KRu0fZBv7UeCEE9k0P4oMOM4=;
        b=xDR6PV7fWjENcWs0zejg46C82vcngvVmQ7Z1u/N/fbYx/BYZBDYnHI5Rj7BtYtf9by
         Wr7UoYmFKqyIyvaPJp1UmFOYcOly8y0v+ISBxzK5S6OA4kqmZCHQXgbLtzSamA+sSSdK
         07PvvVCBSassU+2XFCTNDa1+9s09vm8XOvLzopuvs++2G4WewtRiSEmtnEhuuLXj7MBW
         z92mxWfTwivQkhknA6xkjg0a/2huZ2mWyodfYVxqjlzp3JVKCow0FmpEIwkkTYDPCRMC
         l0qsnKItaLW/jhYA+eEo+cG/N2SNsigggnrKEs77yqWbHVNFdR7nO6C6gT3WsCeSUyYf
         TPcw==
X-Forwarded-Encrypted: i=1; AJvYcCUnhGYOWKBTdYBkHClwSyGTpUG2qt8HzzZUR2lJciyuzDDSaG1E9AEDjWvXKNp45qO+HpS0SkKfqVueF6TeRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dK5blMaLASiEmIpGcMAyPgtp4QWWqSWVtM3CJ4SijMgphd+s
	m1mizUhuc/5Fl2rwgpHqJ9/GSDalCj8Egpd7njept06vkrM83Z5w3YlkfmZyDA==
X-Gm-Gg: AZuq6aIJ62z1KkJUhIPXAU3z6eyKFENtA1JMIMuKLvZhJZwd2lBhV4pibBlzdq8j2th
	aTgUn7GthY6RUQ4WakJy3VAOwa2HmVgJrezA7y4uo7TUX6wcDfgEsUC+e3ImDKzgasVrNKEi26I
	aSJ+Iy1935Cndiqh8/3HH0Tm5kpiSsDFxCRHSBrcVE5KgtXsZM1zIXsFHGamsiE9H+Fg3LAM/fQ
	nWh/G73Y9kKUamXZI7Po1bsAGNaO87LlWWKwAwR8+uuLvB35ZENzbLH9UZ39AI5ot4MYKALg6Ri
	CRaLnrXfjgXpjqdHIQogBDznK7KoMWZFlSViSGGw9x2iE7ZB0ytMo0Ct+fTpPJznidTX8M95aj+
	JVnoS8enAqKWpwgIS+8p2w1dvQbdZGmbfTSuVEzeNiFgMnSjuvJzVNQElIl+ndnNcWe2M89KR7X
	egLpu1AHk2s44wUmEScnN/qpYOK5VlY1TOlWAdSQVo1IKdXEmmt+9+f97q8EQhqFXf4HmOqTP+S
	RLqMUN/uT1eGOiJ6GIdpUK+7g==
X-Received: by 2002:ad4:5cea:0:b0:894:7e6f:f92c with SMTP id 6a1803df08f44-894cc94b68cmr93585776d6.58.1769637220835;
        Wed, 28 Jan 2026 13:53:40 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d40139sm259339985a.37.2026.01.28.13.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:53:40 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 86AD0F4006D;
	Wed, 28 Jan 2026 16:53:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 28 Jan 2026 16:53:39 -0500
X-ME-Sender: <xms:Y4V6aRWeCI0545xWhVYC0QgKyXzbKjvWE1I1YD2FIIqZq_MGCjG33Q>
    <xme:Y4V6aXDCpoxRqfrFdHE-iQshoxUaPhl53sOmzf6PiObqsrOe5k7TnX7_fNwcdGFkn
    FNxFUEqQ3B6SBimHsoQhlmxadVkDHhXi7Jebh7trj0F3tXs6Ard>
X-ME-Received: <xmr:Y4V6aSKJ-OcEbtooGX_Z8XUV-DdD06DZ6JSe8SY8NMDxX0xbhywPOpgCBsVRJFBtSyaLFAWS0xVvsJi5EsqwuVje2OjHIVyv>
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
X-ME-Proxy: <xmx:Y4V6aVRY0js76Ab9iL-NAj3Dfa1r7hjlbos2qnRLH7T0VmNEHVmjJA>
    <xmx:Y4V6aZG6CEzclz06rKczw3viDjSe-W3PBTb0hCEgQCb5yTSVjUOIpg>
    <xmx:Y4V6aSWmlDWEyrZ-ahv2PYB3imIEuL2qZLFuTgEHL37M0RMzw5gsQA>
    <xmx:Y4V6abwwXHEnFm0HoBi71xxD-GDCpawyO-UhYtElFFZt-pL1IXPFyA>
    <xmx:Y4V6ae_1XKKeLD42DLKV3RMY_T8nxl5ttewqSvFjJjH0TtnJXTlJD9Zc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 16:53:38 -0500 (EST)
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
Subject: [RFC PATCH 4/7] drivers: android: binder: Replace `impl_has_work!` with `#[derive(HasField)]`
Date: Wed, 28 Jan 2026 13:53:27 -0800
Message-ID: <20260128215330.58410-5-boqun.feng@gmail.com>
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

`#[derive(HasField)]` offers less code and better ergonomic for defining
a struct with a Work in it. Hence replace the current usage of
`impl_has_work!()`.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 drivers/android/binder/process.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 132055b4790f..2a2510e3a0cb 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -423,6 +423,7 @@ fn new() -> Self {
 /// Strictly speaking, there can be multiple of these per process. There is one for each binder fd
 /// that a process has opened, so processes using several binder contexts have several `Process`
 /// objects. This ensures that the contexts are fully separated.
+#[derive(HasField)]
 #[pin_data]
 pub(crate) struct Process {
     pub(crate) ctx: Arc<Context>,
@@ -451,6 +452,7 @@ pub(crate) struct Process {
 
     // Work node for deferred work item.
     #[pin]
+    #[field]
     defer_work: Work<Process>,
 
     // Links for process list in Context.
@@ -460,10 +462,6 @@ pub(crate) struct Process {
     pub(crate) stats: BinderStats,
 }
 
-kernel::impl_has_work! {
-    impl HasWork<Process> for Process { self.defer_work }
-}
-
 kernel::list::impl_list_arc_safe! {
     impl ListArcSafe<0> for Process { untracked; }
 }
-- 
2.50.1 (Apple Git-155)

