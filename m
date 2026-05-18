Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F83CF663
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089151; cv=none; b=J4z/BfTzCiMj7suRXwQhX/j7NKbwlhice+imFK1hWN7UO6Q8VM6/JGt7ujBowcrrjYQpNdGrmbvmyHN2T8Nq68o0MvNWkbaXkMXJ7iqA9PbQk/RRgxwd1yc85DlPNDkTFCFYZlAh6HQr0JG8BcadkS8CDzg1ytkn/tkpFow4Iuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089151; c=relaxed/simple;
	bh=SBgeeXKKktJrid/8aagfg0Mv5UsO7G1XpQoa4ekCNMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V74C3oCWHJi0tIPT74IY48113Pk4GOTTBo1lBdWGsiwA70eYlL5xts/YhPWQHoiMjbC6DF7FjKTJxc/WfLXaExOtfQxEuSSSh1u8NnbanihcYbTYvrpZ6HWgUAwU5rE4a1vTT4k+tSqK8RGNbQPaUc8RxzpAYnYqvxhnnSqF1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8095d7d75bso599178a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 00:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089149; x=1779693949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAaQdzByLTAMZbeT/prXBHbrX3h0OnMg4B7zWSCYKI4=;
        b=TVm9bUAsr9WgvTbawYkGt2gdC/2rkdK9kwGFhZWHZXu/we3DbC03YCFnIuStYSrx+S
         HbTpyfVzACzkSHevcvbKm1NVs5MhUonI9ONaBNL/UQT1Ewp4iKZe9nzcV5lhkNA1Vorc
         qTKdxyKh2n8mfXp3s1M7grEZtBlRYxxQFC4/J4MrquO74ONdpDqL2GQ8NmJrRn1Uiijf
         dCEFQLCONo8mbnsV6gteMiYo91JJncwCLcJCbex04SixDOgJEBKtysVDdwxDXCBQ0Rzw
         vfqYvEk0A5ITbQZuZSUAZsx3O8NOk3LjqZDWifhd9+3LqWAJjuafwbepOTGXnKmL8OWF
         qa2w==
X-Forwarded-Encrypted: i=1; AFNElJ9yIOZq9wP4q7an5BN3fAsUfGvV836EconMfjxqansACGOA/3J4sdxtQTvmgFkL7C4RVEB7Bn1SFGkGXhEspg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxygefyEXEPFJioTDQz8L5a4wFfTwuO2TMMhj3hF5AYhUeIIiUN
	ZTOuLR/LihixtjPB727gLi/VlEwVNMT0q6TiV9bbeSUwgxc4jr2C66nK
X-Gm-Gg: Acq92OF6m3BE65I1NyA6+TxEaO+ZEi/7TZWxFGlOK0FTZG3afhb+6Wei1iEyQihafGc
	UaiWw7Pj47W7ItGd4GamlK4+yq1Q2s3zm81g2bDX1c77rYM/hu/zKM8+f5TlblB5Xf3V7Yk141A
	hFzYwNEEbwpmWtPR4RycqL9M+ZtF9Q8JE9bIfOn3nTkUzlkJFAAW/8HjlngQjzTCRhoVgzOfHPF
	s4K9Y0Dts5c/+dFKgxTD7Mzt4d8GYCC2hHW1s0r1XnvwKhLep+vunTgg6zMuIfUcnYyjv9YVN7M
	qM4xrdtCv0txMo8gsHzh/xELwHdgmaUTojOYO53AGVTIU/jV54rH7ibE2XwcTW2tGBzM+yJaH2j
	hTLw1SUWp/VaNuYby/vc0H6yuK/6dnlum2aLu1qiQJIkk7lsSMljLOsLDeOFiICIggY8=
X-Received: by 2002:a17:902:f707:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2bd7e8aef4amr153451345ad.25.1779089148919;
        Mon, 18 May 2026 00:25:48 -0700 (PDT)
Received: from [10.0.11.3] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f5d2sm138721635ad.23.2026.05.18.00.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:25:48 -0700 (PDT)
Message-ID: <d58db859-5270-49a0-96d4-4d47375bf73d@kylinos.cn>
Date: Mon, 18 May 2026 15:25:39 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/2] rust: Add safe pointer formatting support
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
References: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
 <20260516023938.12863-1-work@onurozkan.dev>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <20260516023938.12863-1-work@onurozkan.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/16/26 10:39, Onur Özkan wrote:
> On Tue, 12 May 2026 16:55:26 +0800
> Ke Sun <sunke@kylinos.cn> wrote:
>
>> This series fixes two issues with {:p} pointer formatting:
>> - The impl_fmt_adapter_forward! macro destructures self into a local
>>    variable, causing {:p} to print a stack address instead of the actual
>>    pointer
>> - Kernel address leak — {:p} prints raw pointer values, exposing kernel
>>    address space layout
>>
>> ---
>> Changes in v12:
>> - Split into 2 patches: fix {:p} printing stack addresses → route {:p}
>>    through HashedPtr
>> - Test cleanup: NoHashPointersGuard RAII guard replaces raw
>>    save/restore; mod expected consolidates 32/64-bit constants
>> - Impl delegation: &T, &mut T, *mut T all forward to *const T (matching
>>    core library conventions), replacing v11's blanket impl + macro
>> - Link to v11: https://lore.kernel.org/r/20260205-hashedptr-v11-1-bd0fec7fe6f1@kylinos.cn
>>
>> Changes in v11:
>> - Fix inaccurate or inappropriate descriptions in comments
>> - Use as_char_ptr instead of as_ptr so that a *const u8 pointer is
>>    always passed to scnprintf on all architectures
>> - Per Tamir's suggestion, replace doctests with mod tests and adjust
>>    test content to make the tests more meaningful
>> - Remove the RawPtr wrapper type: it and HashedPtr use different
>>    formatting mechanisms (HashedPtr uses scnprintf and pad; RawPtr would
>>    call core's Pointer impl directly). This series focuses on fixing the
>>    issue that without it {:p} would output the pointer's stack address,
>>    and on using HashedPtr to safely format raw pointers and avoid leaking
>>    kernel address space layout information
>> - Link to v10: https://lore.kernel.org/r/20260121050059.2315091-1-sunke@kylinos.cn
>>
>> Changes in v10:
>> - Merge all patches into a single patch
>> - Improve `kernel::fmt::Pointer` trait implementation
>> Link to v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn
>>
>> Changes in v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn
>> - Refactor implementation to use Pointer trait and Adapter pattern
>>    instead of exporting ptr_to_hashval() from lib/vsprintf.c. Use
>>    scnprintf directly in Rust for pointer hashing, eliminating the
>>    need for C function export
>> - Move pointer wrapper types from rust/kernel/ptr.rs to
>>    rust/kernel/fmt.rs
>> - Split implementation into more granular patches: Pointer trait
>>    foundation, HashedPtr type, raw pointer default behavior, and
>>    RawPtr type
>> - Remove documentation patch, integrate examples into code doctests
>> - Simplify API and improve code organization following Display trait
>>    pattern
>> - Link to v8: https://lore.kernel.org/r/20260101081605.1300953-1-sunke@kylinos.cn
>>
>> Changes in v8:
>> - Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
>>    EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
>>    pointer wrapper types (HashedPtr, RawPtr) for %p and %px
>> - Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct
>>    construction
>> - Link to v7: https://lore.kernel.org/r/20251229072157.3857053-1-sunke@kylinos.cn
>>
>> Changes in v7:
>> - Refactor kptr_restrict handling: extract kptr_restrict_value() from
>>    restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
>>    improve RestrictedPtr::fmt() implementation to directly handle
>>    kptr_restrict_value() return values (0, 1, 2, -1) for better code
>>    clarity
>> - Remove Debug derive from pointer wrapper types (HashedPtr,
>>    RestrictedPtr, RawPtr)
>> - Link to v6: https://lore.kernel.org/r/20251227033958.3713232-1-sunke@kylinos.cn
>>
>> Changes in v6:
>> - Fix placeholder formatting to use `f.pad()` instead of `f.write_str()`
>>    in format_hashed_ptr(), ensuring width, alignment, and padding options
>>    are correctly applied to PTR_PLACEHOLDER
>> - Link to v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn
>>
>> Changes in v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn
>> - Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs
>>    using kernel vertical style with alphabetical ordering
>> - Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed
>>    Clippy warning)
>> - Update type ordering to alphabetical (HashedPtr, RawPtr,
>>    RestrictedPtr) in fmt.rs macro invocation
>> - Link to v4: https://lore.kernel.org/r/20251225225709.3944255-1-sunke@kylinos.cn
>>
>> Changes in v4:
>> - Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve
>>    formatting options (width, alignment, padding characters)
>> - Improve code structure: reduce unsafe block scope, use early return
>>    pattern
>> - Add doctests with formatting option tests for all pointer wrapper
>>    types
>> - Enhance documentation with detailed formatting options section,
>>    including examples for width, alignment, and padding
>> - Fix RestrictedPtr example to use pr_info! instead of seq_print! in
>>    docs
>> - Link to v3: https://lore.kernel.org/r/20251224081315.729684-1-sunke@kylinos.cn
>>
>> Changes in v3:
>> - Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
>> - Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
>>    rust/kernel/ptr.rs corresponding to %p, %pK, and %px
>> - Make raw pointers automatically use HashedPtr when formatted with {:p}
>> - Add documentation for pointer wrapper types
>> - Link to v2: https://lore.kernel.org/r/20251223033018.2814732-1-sunke@kylinos.cn
>>
>> Changes in v2:
>> - Disabled {:p} raw pointer printing by default to prevent accidental
>>    information leaks
>> - Link to v1: https://lore.kernel.org/r/20251218032709.2184890-1-sunke@kylinos.cn
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>>
>> ---
>> Ke Sun (2):
>>        rust: fmt: fix {:p} printing stack addresses
>>        rust: fmt: route {:p} through HashedPtr to prevent address leaks
>>
>>   rust/kernel/fmt.rs | 178 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 176 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 50897c955902c93ae71c38698abb910525ebdc89
>> change-id: 20260512-hashedptr-22469b930113
>>
>> Best regards,
>> -- 
>> Ke Sun <sunke@kylinos.cn>
>>
> FYI new versions are usually sent separately and should include the changelog
> (typically in the cover letter) as well as links to the previous versions.

Thanks for the review. I'd like to collect more feedback before 
submitting a formal new revision of the patch.

Best regards,
Ke Sun

>
> Onur
>
