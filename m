Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29736E47E;
	Sun,  8 Feb 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770567126; cv=none; b=k8yDhDDriT0QMz5bTNjV27nQB1guWz3r9YR2qNij2JxAInAdXa76nJ0Jz5ptFhhSKTBpZZ0346SnWWo5gTpWeFhgkiw81CyV4T5dX2J4YYTchQfN2uFCo9cOjxfaixG0TdZKhIvPercGh7C9s+CIXgq4JkUKYjfoMyQz9AZB6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770567126; c=relaxed/simple;
	bh=B3YeXMSvaUH6ax+8PoQTMY2BZ6l33YKhhW9kmPAu1Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJNSoUdWH/uYqwzhE/fOW0GGen4X/G1KP30Iio2AIhJYiMMZ/iiJ3EnfIt4s/icKEenGfIKQySJYw+DMyP0B3IJzIZayilCsqV4PfsMQFZ9sfOVoIXKOVOBgZgsQ0B+MppwOYIpjjVeXxVfKW7m+FxluRYEhf6tOQ422AI1PJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=BJJL9J2L; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="BJJL9J2L"
Message-ID: <ccf56514-d8e6-483b-a8b4-06bc32728ac8@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1770567113; bh=B3YeXMSvaUH6ax+8PoQTMY2BZ6l33YKhhW9kmPAu1Zc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BJJL9J2L2z3nswtjQif5VeAo1IJECMr/K6pAId855sPy0aJ361lMTTlf053s6eogZ
	 FR7Ihyq7XbGP3eyrnW/sMFJx+OUHXce5UxJbl5QcIl7aEN6uzM5eQz0/B6ReXYbkl4
	 yiuzI2x/ug9VfkzznMQ2ZybSY9iNlSQG9+EE+oogbqCNMpZKUs7XhVX6RUkJKbIC1h
	 LODcffK/34vIzS6d4Mma8WrOR8/9lIlvrr17S/xgBOShhLKuXSkJWLfE3Je5qKATyx
	 AUC1p+Pmt0NkZ1lAnDsYsRk/2F+m5Hv5g/QYlx2JecsSjaNX3T4yA38OVAr0DIbNC1
	 ChFzR7+d8wo7w==
Date: Sun, 8 Feb 2026 21:41:44 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rust: kvec: implement shrink_to and shrink_to_fit
 for Vec
To: Danilo Krummrich <dakr@kernel.org>,
 Shivam Kalra via B4 Relay <devnull+shivamklr.cock.li@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <20260207-binder-shrink-vec-v3-v3-2-8ff388563427@cock.li>
 <DG8WJPYVA0H1.1PO95BAW0TK3Y@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamklr@cock.li>
In-Reply-To: <DG8WJPYVA0H1.1PO95BAW0TK3Y@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/26 22:53, Danilo Krummrich wrote:
> This is the specific heuristic we use for the Vmalloc shrink workaround
> (including when for KVmalloc is_vmalloc_addr() is true) and it doesn't belong
> into the common code path.
> 
> But this goes away anyways with the above changes.

Thanks for the review, Danilo!
I understand the suggestion to restructure.
I'll rework the patches accordingly and send v4 in a few days
after giving others time to provide feedback on this version.
Best,
Shivam
