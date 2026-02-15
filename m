Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD2E236453;
	Sun, 15 Feb 2026 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771185834; cv=none; b=VMG7hBA0xfcW/aqcxCxBXYOt501XrY8KK3m6UA39x5AKBTHizsRiKC0Dd348W207WkLgjRQgLlX66P/1YO2O9E2/fBnyYc6JmO3B0Z12ueA5JDdcWDsHi5DyvJGFTO2IXpLXGBN09w9Ok+SDmeMacZnUzyveFHxeTX7i4DXoclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771185834; c=relaxed/simple;
	bh=J3t/Dz+oED8t1uuEA1ZoRdXNWCBzjMMsc5X22A9qboM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ddU5AtZRjzDiHzNQNJ7ByihJC8Lj3MAp6pNic7mKG1pdIZxCc/GIOsK9S2b6JyxlnY71HP22UreIR3ksV9KQRoIug3AvAfLwCLfFSE9UbkLr6RNqF4FmzB3J+zwcJHSIG7Lwc5Kbus5WFhc17RDQVB25BJX9Nu7IOyo2eY59j6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8q0AdeP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8q0AdeP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F31C4CEF7;
	Sun, 15 Feb 2026 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771185834;
	bh=J3t/Dz+oED8t1uuEA1ZoRdXNWCBzjMMsc5X22A9qboM=;
	h=From:Subject:Date:To:Cc:From;
	b=K8q0AdePSZ0ZRnGYvwcPfgWhv+ETE7dpGUfjPae4FXj80cACogswmr7LupGSodPzy
	 ACD5rSvn/6ySs3D9Yh/qTNxDlB9qO84Gtcr0yFzE1IZcOB7YPuLSSjqfzahBrw4D34
	 xZszQCrAbRe7ntVA/SWunlPMSfzeYu/i9yWca5f88tYX6EXzZTAbns30pBz4XYAqXn
	 1xbo3QioOIB3WvxjfdFkV5iXLcA1KhXTqEu7RUnQqXR0P81CBkkscxIJhM+W6//u7M
	 v/B3/rlJaS9W2QFzg2gv0tBj3GnF/fDBe0FiGtjJnbvATJxwsMQ7+hTKoHZDwOeqRe
	 6xjNqRnnujBuA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 0/2] rust: pages that cannot be racy
Date: Sun, 15 Feb 2026 21:03:29 +0100
Message-Id: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJImkmkC/02NOw7DIBBEr4K2DhFgQwRXiVxgWBIK/8C2Ilm+e
 1Zxk/KNZt4cULFkrODYAQX3XPM0Esgbg/D24wt5jsSghDJCSc1nT5mPMa/UrLwPjRGtQZtSBBr
 NBVP+/ITP7uKCy0be9Qqh9xV5mIYhr47t5i4t/J85RldaNELzbczLhpyMXNkUonnoZNG6XbbQn
 ecXe18HBbwAAAA=
X-Change-ID: 20260215-page-additions-bc36046e9ffd
To: Alice Ryhl <aliceryhl@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=J3t/Dz+oED8t1uuEA1ZoRdXNWCBzjMMsc5X22A9qboM=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkiaTu168SUSLg+pWYFC54waDl4cp54u+mshlC
 QrjDdTP9FSJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZImkwAKCRDhuBo+eShj
 d+C3EACQBF0qgfiP2oREwlY7BugQ7tZqaslNUSoWwp1CyCFvXAV7pbejUVgl7PvL+C8uQ+sxtex
 e8c9MQICKH47xTIE62zY5dRMgJeFTG2IdQQdhBVXOws9Hy3IbxejC6ePBt9oG+cwydMUiki5Xj9
 SQl43WYdW0Nu9t/Rv5TFHT+0wnyTYUZiNWfs0F78NBsT7jNw52d24hpRWYpHPQ82HV0tFhBrU8l
 iGuaKjt/IKuJvhmJYLX6GyoK+G80bYf14yf9JWrDERegsnoi5zek8GFVEvMQeK/MZFBJUh99quv
 jlYKhB3eInjRcV0sJTzN8Wc61DCEFcbZEKKD+6972bU3hXJh6sb1gKluzRPCcTRqQeDobDgOJMq
 b0txZu+XYTHiz6s3rwKs6QXqOko8hJN5T2wt43s7vW79BIzjzf++BFdvAV+8yw0m4WzRiNGfs4D
 S6n70kdXAFsP6EzKzaezy6xftO1krGLlVtyIjAI8Q2HyrUV7KvRNjPm24sCwB4iiMDjA2h94eJ6
 osk5lzMkrnPOSfdBkXkKCJut9aOEi++sIk4HEgxizHtNJ5os8KPmFn7rfObMhDsDtn6cnDBkkAs
 cg7Mp98pH7Q2uNa5FogaYZS0lqvwSMZ9JGajDcntv0oAcq6VKfD74+WzB4/jnQjEOjV9hSK0xOa
 rjcry05bh2GQGzg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Some drivers might want to use pages for data storage in the same way
one would use an array of u8. The current page cannot be used for this
purpose, as it provides no guarantees for how it is accessed.

This series adds a newtype around `Page` with an additional invariant
that the data of the page does not incur races. This makes it possible
to treat the page as a regular array and even obtain a slice into the
page.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Andreas Hindborg (2):
      rust: page: add `SafePage` for race-free page access
      rust: page: add method to copy data between safe pages

 rust/kernel/page.rs | 102 ++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 7 deletions(-)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260215-page-additions-bc36046e9ffd
prerequisite-change-id: 20250305-unique-ref-29fcd675f9e9:v14
prerequisite-patch-id: cd414158ad8a77616cf5e20f01212929fe4a9b4d
prerequisite-patch-id: ff052142fd3b16d7190b0ad2fb79cc39813e49fd
prerequisite-patch-id: 4da98d17bef5f809a9caad013bab670f661c8d4e
prerequisite-patch-id: a31185fe1abbf553377d6d695c5d206eebc84358
prerequisite-patch-id: 8074279c3569e7997f7a993a8ecac7b977b4509a
prerequisite-patch-id: 541dba7938ba874f8d17fee05a36b1cd9fa2c4d7
prerequisite-patch-id: b7eb6740359975d4d781fbd4f684bc5a8ec277f1
prerequisite-patch-id: d83fb5f310b84492bdf44eeec0f9d3d3146a73f5
prerequisite-patch-id: 77308c47591e44920a3bc0279a4d9013035fcac3

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


