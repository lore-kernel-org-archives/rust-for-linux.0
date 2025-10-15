Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7143090EF
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556305; cv=none; b=e0n+GzBpBTfO2iOlXPptnGKIS9OALV7mK8+5aruuHAL1XyMGqVbM6hvV8wxeYPXNcbw1hxDCo8fJU2WPoF+yi3XDVkPCGH4D7sUn+VfpzRb1vhCg3ofMXUcE63YJW6cXj5XC56AgHk4Rvlgi5RdHPxqskCUNZc36RGCAO75ExKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556305; c=relaxed/simple;
	bh=2Vk6qFD+khvBWosYiPgnWwsc9w2ItSZw9y9K7Wf3lO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9FlVzaW23G/KC2KUAkApkjwlTweu3gcF0/jpElSdZNChyy2KhE1+s1zeTPoxdcWOajzYeU2XVr9kHgAImvcC9hRFQuT2s1j2gRsj9GPhxuorCIoh9jk0Eu310mFFqebyt0OHv7/UKxB8XHsxOxxl6mn1pzmbsy/Mn7gJ0+xSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlhWDi91; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlhWDi91"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-87a092251eeso23819796d6.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556302; x=1761161102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjPhqOIsQnP5icf3xI8+fTWI6demrBvMGeJug28QAmc=;
        b=nlhWDi91qOdTS06ilTTWQqtxrya8sKOBO4uYooo3tAkXgmoaZAAQpqclmG+Qemtj5n
         XMrGgYVkjdysr0wizWs3RX7uQ0cAhIJBRxoGnSF7I1F4HnmBMxUqzckCOU12ahfm0BNb
         IDJINVcC+rXwHuD7BRtZQhSnP9MBxaeGzZkDoketIXMWAGvXnOSulJvfcB2/5quP6vlq
         wEDRUny+HsPm3CogvL48V6a2JzeQ+6Is/FxZpweOdc4YWyVu71H1V0FegJmi7/j9hkG/
         O/R+eq/fgpI6w1hE4q/iXU6MxKUDViYudjtsn1hw0IaC03q7OTS0jwrTrmKzmqbreEQo
         lulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556302; x=1761161102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjPhqOIsQnP5icf3xI8+fTWI6demrBvMGeJug28QAmc=;
        b=UiOS9N6rOUagiIZMD5lwie4riUmwPQV6Qid6wEDOli/21r+9d6iW6VhfTCNHaqVWdU
         6e3VOujwMOU1RLI2Cd9ldmXIvuub4OVTK3C2s/KAojGZuhWrmpXqxwgaf3a9CsZ3cLpp
         QQ6HALv9uQOCnKHzUK+LkvwUmtPxj0Vbxsr5gujCTcnGIALJS2t/Egeu9qx8X4+oLN7E
         Pd6F7JEbALwIIG3bLiCDmdWDHmNhOG0Lc1YjV7E8TYQ7H0Mt1NCOuTXN/LdaJyE5zxgi
         P8a78Odm5tcxzmyg8SNSHiJIgilvjOSLFmlsSewFnzfhrJHaN45BfHn+NUjGN31iu+xs
         SMQA==
X-Gm-Message-State: AOJu0Yzlgqgqp3v5aAtIUhmBCF6qN9JkJGGdmMVLuREcVrP31IjtZ0cE
	V4UCtP9NQSAfCXogc7+WeEQs1lZ9xIowXl0RW5oB46NlgAruqLkXKytQDedKeSen
X-Gm-Gg: ASbGncvUuxCaHkzta3zuPCZlo7CSWC9fnh2iEaJNck2CeKSOWprbWmmN3ObAdDPugwY
	eZm8aCc8B8kuV6WOmJRICThSvxkPj8f5MZdoTykTTu6yclGyOJiyTKGPc0B/ruQqzPrHwtoVGqU
	Niqk541YyNCkJV6iv/jpPzOJgeuO9okwxDQ/c+JF3OKBr4IERZX8KRsNKRWuf4lca0X02Um7KGL
	AcTX/ZSd0HZsDtn70W8LzIaDtBFeimj9nJgWGs88p62WlmoT6SSmxMbjA7WNvRJE5yQ7dG261bs
	3QJoplo6uNS9t73cIa6fIWUFldrw5BTfUdTpM7kjI0PsGkfLGMaScfAyhHaURo073DEgdoI9mgz
	gbwq33wh7lnHBgvCqrxPMcs9CiM3W1oyl0SCx1wtdZZ/K2GcIyWRopcKu6Kcm2w+VBkrqxH3+e7
	Hsu/DGKR+jpHpl2RERVZTVt8uDhV3dDsJl/8McUkhTCDEXp0amgwZrS5hae8C8bMVicqEeshscd
	Mz1eOoAo2/WzmRcvXHtuXKRGNUAKfUx5CWx9Us2Zp0sMI8hdEDvE2HIkJNWrXQ=
X-Google-Smtp-Source: AGHT+IE/6/93cmzALh4Jmouh/MLI95PCde1EljHLkZKlJY4iPwz/j8r/4JCLGlbGVcRLXtlHwQc0sw==
X-Received: by 2002:ad4:596f:0:b0:783:f54f:418a with SMTP id 6a1803df08f44-87c0c8131a5mr22292536d6.15.1760556301319;
        Wed, 15 Oct 2025 12:25:01 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:31 -0400
Subject: [PATCH v17 01/11] samples: rust: platform: remove trailing commas
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-1-dc5e7aec870d@gmail.com>
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1642;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=2Vk6qFD+khvBWosYiPgnWwsc9w2ItSZw9y9K7Wf3lO0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKJ1BUAmPVQjuKlRlHXyE7o0qpMUW2qdVnOqngFN6VFfXZIKKvKAJg9piKZPdbhI25H2DhoqGoP
 iQgwB+DS24Aw=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This prepares for a later commit in which we introduce a custom
formatting macro; that macro doesn't handle trailing commas so just
remove them.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_platform.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 6473baf4f120..8a82e251820f 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -146,7 +146,7 @@ fn properties_parse(dev: &device::Device) -> Result {
 
         let name = c_str!("test,u32-optional-prop");
         let prop = fwnode.property_read::<u32>(name).or(0x12);
-        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n",);
+        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n");
 
         // A missing required property will print an error. Discard the error to
         // prevent properties_parse from failing in that case.
@@ -161,7 +161,7 @@ fn properties_parse(dev: &device::Device) -> Result {
         let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
         let len = fwnode.property_count_elem::<u16>(name)?;
-        dev_info!(dev, "'{name}' length is {len}\n",);
+        dev_info!(dev, "'{name}' length is {len}\n");
 
         let name = c_str!("test,i16-array");
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;

-- 
2.51.0

