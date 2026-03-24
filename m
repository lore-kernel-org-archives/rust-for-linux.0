Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB062DCBEC
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382569; cv=none; b=UbzZAaLfkwSp8gfHQacPLDsfMWTZ7Jle4L1iOO8JwsA5tlJY8rik/vWO66ao5fTEumkA9FJL8D8RFSPlTHll38Qt+I378qRfrsUW1wc6qc/+i1Qky7eLy47+ApIpIH5mw8Crli3uv/QF5oELjixIJixHAerF8uQIVXvS+2Oq53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382569; c=relaxed/simple;
	bh=+Goy4D64nuP+BbSnhf7OhMpniV+yBTmRzYy1fAklWlE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QyRV1jUcISiOOLP2/MqsgDqrwfKkqAfrIkF/k/0HoiRTIJC4rOs7nXRNxjoIBPYw5/XOqfqKo2MsW1kIc+oIk9XkQyAJVmA3Lzzjw9+kzmlLt7Y+sPngPsDqYtcsuKdTpgNVcckmzmicjekQSdjpUp7ukU08Pmcnk/TEQIlkp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cUX0jcEH; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cUX0jcEH"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-66952b873a0so2814892a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774382566; x=1774987366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1UbzXXxdNCI8P0ffOKTyNxYTiEdwXYX6YILJ8CGqb4=;
        b=cUX0jcEHyfrPklEKLVaSFKKchh/3BUFITyxxjgk1jSRnOE2V1v91jWCpvBqm9nr38q
         9RcdohGaiLn4jrzEPsKQpgiqR9UIQDflbBxm9MBv6YMho5oUkoAlNuLjmMZOnNmvvQRz
         TZ2XL/rDCGwAsVMDJzEnrXV+5zBYC/kMy+7v0Q7FgdzL2jAmDFVYMKcznsc/h+G8qrIr
         B6QUyn8DZvmZAFvj7QKTvNwjqqMjGDviZpzNwmdzbBYVJW7dfmKNTYlynP+Mv53rS+P0
         s7gW2JQhiTiJCuEP5SQ/ftio/5h2BAhn7xhWCfnQwb3ZTskiX+15JdyXsK7CpLHhwpCD
         1Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382566; x=1774987366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1UbzXXxdNCI8P0ffOKTyNxYTiEdwXYX6YILJ8CGqb4=;
        b=IIHq8B35eOncGL9ow9PsxlWXeW4ARZoJGlWPlhhuMz2Dm234QY2pTQrtw+0HmZQ4H2
         O9r0wSeR5fXZEA8rsrP0hK0WOdECya88blXTz/2AfElc2uCT38HjaAzGGwwtItHW5BgL
         6v4JPFdnfgS+xeZkSV7GfqEAOV+hTTy00/V68mtZGMEpq638bRKjeJrRDRyTTcplXWON
         xMxCRy4zJb73X3I8eej2f6K3btdioMAAhbhNXm87mY4hZqbRpcUtAL2kVe9yd6xmQdjs
         DoGtnhVr0VcFLZGVsQLyVB7MZA04/c+TFolZm86lVAzgxOJB5FnS4AUVI8u8zr9BwarA
         TqeA==
X-Gm-Message-State: AOJu0YzaWG0josfR9q3uPwMMsxVyi1m6+SI525dujETOrh/QmruiQx3T
	trCd5gNj0FrPbHoDLEix/UkRQiU1qhQj1t1S3Mc82Qi8Opy+Md0GadP2KEtXQ1rqlyAQ6hOUOdi
	1nwcQ9Bcykut4qMUXTw==
X-Received: from edi11.prod.google.com ([2002:a05:6402:304b:b0:668:4fa5:f392])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34d4:b0:66a:50c2:6bd6 with SMTP id 4fb4d7f45d1cf-66a826bd59amr376521a12.23.1774382565851;
 Tue, 24 Mar 2026 13:02:45 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:02:35 +0000
In-Reply-To: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+Goy4D64nuP+BbSnhf7OhMpniV+yBTmRzYy1fAklWlE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwu3jwfsxkArEc4b6yvmEdSGyMepeXIO0IZSUf
 971f3ft1AaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacLt4wAKCRAEWL7uWMY5
 RnROEACer8y9e1AX57xRlq+4getDONYDY0NmA48HXkPrAUVJilmcAUhbgwSpvBSnYjkw9N03+/0
 Vwra4T7rlL15qR8hRCEu1B7dDd3olIvjUMQtVRNsKmpauY7bJOVG+ukZqpgKLy3xuvAtIIuZ3MK
 dYY74dqjXVMlKM/Tr5R0pY3h4JsPGcPqT1ofE+QXaUjdv2xR3NUV7pnfLgtGJPqDqtqQZAT8ffu
 aa4F1zBQm95mH9KVgNpDjqrdUA/9q6RYtOwbPhL2IqCi9zV9ecITVGD2nhV0IKgWs5RsJeEl7JS
 b5rtpwhPnftqlA7T1oYOM4JNX+1Er+weiyJkAPrfZZrIdR/3C9uO8/lRXqfY9/FC6M85LDx9957
 maC6i6vO/1/HPHailqG75DpruvGw50me9XuGDw2/i81QBblJrjO5czR5jpfE2rwkkueQIf6Zfn/
 ffIrXjvZe3F6Uh5vveWxp35KmTZKDr4IsZEHF+vKLKh+hlDoEPfCPHKcyHpt641yxsh9omjtXpx
 SgWSorsjZ0A6S2iWHALxM55yUFRsbwnTizYIRetC+7u9MbfNPbUxn+U2bH/RMi1NzDb2zJBMLeM
 dad1HP3CAWRYxvP3IKtZEfSQrb5WCRf5xD+Gmbh1cutysDt42gImD/m2SLVv6fvV6m9i73y+B+/ zjU6EonJvLaZAIQ==
X-Mailer: b4 0.14.3
Message-ID: <20260324-close-fd-check-current-v3-1-b94274bedac7@google.com>
Subject: [PATCH v3 1/4] rust: sync: implement == operator for ARef
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust Binder wants to perform a comparison between ARef<Task> and &Task,
so define the == operator for ARef<_> when compared with another ARef<_>
or just a reference. The operator is implemented in terms of the same
operator applied to the inner type.

Note that PartialEq<U> cannot be implemented because it would overlap
with the impl for ARef<U>.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/aref.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 0616c0353c2b..9989f56d0605 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -170,3 +170,25 @@ fn drop(&mut self) {
         unsafe { T::dec_ref(self.ptr) };
     }
 }
+
+impl<T, U> PartialEq<ARef<U>> for ARef<T>
+where
+    T: AlwaysRefCounted + PartialEq<U>,
+    U: AlwaysRefCounted,
+{
+    #[inline]
+    fn eq(&self, other: &ARef<U>) -> bool {
+        T::eq(&**self, &**other)
+    }
+}
+impl<T: AlwaysRefCounted + Eq> Eq for ARef<T> {}
+
+impl<T, U> PartialEq<&'_ U> for ARef<T>
+where
+    T: AlwaysRefCounted + PartialEq<U>,
+{
+    #[inline]
+    fn eq(&self, other: &&U) -> bool {
+        T::eq(&**self, other)
+    }
+}

-- 
2.53.0.1018.g2bb0e51243-goog

