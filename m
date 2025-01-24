Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1801E3DE3;
	Fri, 24 Jan 2025 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737762174; cv=none; b=KffqRKDk/kjYBEFX4RM9kLFNlrB89JSFr6SE2c/px5X4x8WPHPEvDbFBrR3DRZ9/eC7EX6esqXuVofqoWOX+e/8rL4lYU77IyV/QNyMOqr4vY7ELPC13HT9YhElTKGnzAfT0OroNRFN8Lj6iHWCoiKBprDE+fnxrOSBxfQLSSwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737762174; c=relaxed/simple;
	bh=S6pwMLjzP2wkK4Bq/3U1N8j1q4kPKr1Tehxo0x0HWCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfFqneEK+UmDkh0b//vS/U+0LMthGbZBKxogMKlUe1i16KnO42lHORewXxdZ0MCE7Yv/Y5iQ/OYD8r45eJnMDIJ/tYO1H8pPXHBQ187a3P2jXuLun5NkqxNfiwXnW2gOHSJOcvrGfGwx3SB7bjaTigWPWcnXMRbIQ618FOMtPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BF6xNmI1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BF6xNmI1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso17952735e9.0;
        Fri, 24 Jan 2025 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737762170; x=1738366970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3y1scysXwxdGFG3il4jWK9KCpSGrRoYG/ka61bsCR0=;
        b=BF6xNmI1jMe85oYIEScYjjh3DpqzBNFQToKM39skOExompgvtTUa+/yuTubZM8WM+w
         vKfhHuPzUmki4+kOCizmNHWxX32rexBMRCJxlCUy8o6sptDz9RT8jGW8I3qrpVeS3MXz
         7orD7W20Gn2gyb1i0VggqbIz3W6vJilSGjVFEz3bW+7XVVcmlsWkmqdiAlne1N5XG7US
         apSvwgtrMHdTN+5lVY3n9EWF/SjwDC6ij2cDy1tXukP9AAgB4F+5FFGR4H1jtEF0TWrp
         W3+Ou2Xun82JestKQyADV5WRhzyRsCzKCsg//PTKs9OKV33WBpv/mI9bGZIyFekPhDKR
         MYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737762170; x=1738366970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3y1scysXwxdGFG3il4jWK9KCpSGrRoYG/ka61bsCR0=;
        b=dhDZym3WmCIo/eOp5ruMFwzL8IMlF/g78Zj31SjuZAagkvoIuKwkv65aNmHYng4Veo
         Ihvf0rQEJ/fCqiz1l/gagS9cEaNIBFOyQAeH4Vfw/UEmEh5WomcWUTFZAFhz3Ppn4Xhw
         NbIR8c0nf8wmf+7gJk06EBYHqS6EnReQYubhHQMTT+rC5YcguydXEE3V1gMUU/+s58sF
         QBvRRJlxz81zGVWQI1hF9E9mm+z4Rx9KsNMR3bVANKyBAvir/KncdzCl3KSnmGevstN/
         YrqqDkVV28+DkVtVJHAngr+QgiDkTN1NXT3buTFZOmNHlatiYECaUORjrwZV1gDCpUST
         Lp3A==
X-Forwarded-Encrypted: i=1; AJvYcCUNLIsZJFX8L1Wd5iXDuPvw0wdW36bLF/pv9pPB0Gp9/W/Tbow2FUusg1okrOMo5ynYquVSAVHm/mMZ0eQ=@vger.kernel.org, AJvYcCVZLbJ4PbXu8vbgBm41ocPvgS8/dcrB4twzvAoezlMdrgOLEn4Ms0bHvrpXsLCHlH3uyvjymFQMdjHOUmkPdRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YySHtznNs8d4mH693+WphoZXefGFd6J+hUSFx716BBj1PFS6PD4
	+BRtif3ly7J/NJ104MK53SYHbgd3DrEqRhEqaA4NXrc5i6EBegnt
X-Gm-Gg: ASbGncu2CTT3u/2BkU++FFlOh41sGSMes8J0KEHs+Nnbtkek62/1TeV5pt5qkbnIikd
	n+H+bewGTkug0VbMxjqWX01T7g6so3u+uD56EgeAvGEqctTo4Ds+/+UOUTJgX8rQR1s/7XuaHaz
	69+Q4YgL21AZcJs3PujDJ5CbW1aE3/e2TqSnw990c6EP+UUfAeUNTA+N66AYzyuhyCStzsnrP4m
	csrR1uCj9jjVXZmVE0ADXvSThD9o1qTo5G3BlD2kTWnFEwaztQUVSg2V0hH/9mpYv1g3qJziCRN
	E+bsyR/IAmuOA/uvaQOvIflGl4V4
X-Google-Smtp-Source: AGHT+IHTE9UN1aSMRqUOf/4pOrvt7ox3mKavhSh/tTzet1Pu8JwTqx2prW9WUdnCLA0+wYF7UWtJJQ==
X-Received: by 2002:a5d:64a1:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-38bf56555cfmr30485272f8f.3.1737762168583;
        Fri, 24 Jan 2025 15:42:48 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb062sm3989248f8f.71.2025.01.24.15.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 15:42:48 -0800 (PST)
Message-ID: <4742691b-0d36-4d9d-a629-95cd046f4f35@gmail.com>
Date: Sat, 25 Jan 2025 00:42:38 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: miscdevice: change how f_ops vtable is constructed
To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250117-miscdevice-fops-change-v1-1-ec04b701c076@google.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250117-miscdevice-fops-change-v1-1-ec04b701c076@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.01.25 3:22 PM, Alice Ryhl wrote:
> I was helping someone with writing a new Rust abstraction, and we were
> using the miscdevice abstraction as an example. While doing this, it
> became clear to me that the way I implemented the f_ops vtable is
> confusing to new Rust users, and that the approach used by the block
> abstractions is less confusing.
> 
> Thus, update the miscdevice abstractions to use the same approach as
> rust/kernel/block/mq/operations.rs.
> 
> Sorry about the large diff. This changes the indentation of a large
> amount of code.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

>  rust/kernel/miscdevice.rs | 295 ++++++++++++++++++++++------------------------
>  1 file changed, 141 insertions(+), 154 deletions(-)
> 
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index dfb363630c70..ad02434cbeaf 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -39,7 +39,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
>          let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
>          result.minor = bindings::MISC_DYNAMIC_MINOR as _;
>          result.name = self.name.as_char_ptr();
> -        result.fops = create_vtable::<T>();
> +        result.fops = MiscdeviceVTable::<T>::build();
>          result
>      }
>  }
> @@ -164,171 +164,158 @@ fn show_fdinfo(
>      }
>  }
>  
> -const fn create_vtable<T: MiscDevice>() -> &'static bindings::file_operations {
> -    const fn maybe_fn<T: Copy>(check: bool, func: T) -> Option<T> {
> -        if check {
> -            Some(func)
> -        } else {
> -            None
> +/// A vtable for the file operations of a Rust miscdevice.
> +struct MiscdeviceVTable<T: MiscDevice>(PhantomData<T>);
> +
> +impl<T: MiscDevice> MiscdeviceVTable<T> {
> +    /// # Safety
> +    ///
> +    /// `file` and `inode` must be the file and inode for a file that is undergoing initialization.
> +    /// The file must be associated with a `MiscDeviceRegistration<T>`.
> +    unsafe extern "C" fn open(inode: *mut bindings::inode, raw_file: *mut bindings::file) -> c_int {
> +        // SAFETY: The pointers are valid and for a file being opened.
> +        let ret = unsafe { bindings::generic_file_open(inode, raw_file) };
> +        if ret != 0 {
> +            return ret;
>          }
> -    }
>  
> -    struct VtableHelper<T: MiscDevice> {
> -        _t: PhantomData<T>,
> -    }
> -    impl<T: MiscDevice> VtableHelper<T> {
> -        const VTABLE: bindings::file_operations = bindings::file_operations {
> -            open: Some(fops_open::<T>),
> -            release: Some(fops_release::<T>),
> -            unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
> -            #[cfg(CONFIG_COMPAT)]
> -            compat_ioctl: if T::HAS_COMPAT_IOCTL {
> -                Some(fops_compat_ioctl::<T>)
> -            } else if T::HAS_IOCTL {
> -                Some(bindings::compat_ptr_ioctl)
> -            } else {
> -                None
> -            },
> -            show_fdinfo: maybe_fn(T::HAS_SHOW_FDINFO, fops_show_fdinfo::<T>),
> -            // SAFETY: All zeros is a valid value for `bindings::file_operations`.
> -            ..unsafe { MaybeUninit::zeroed().assume_init() }
> -        };
> -    }
> +        // SAFETY: The open call of a file can access the private data.
> +        let misc_ptr = unsafe { (*raw_file).private_data };
>  
> -    &VtableHelper::<T>::VTABLE
> -}
> +        // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
> +        // associated `struct miscdevice` before calling into this method. Furthermore, `misc_open()`
> +        // ensures that the miscdevice can't be unregistered and freed during this call to `fops_open`.
> +        let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
>  
> -/// # Safety
> -///
> -/// `file` and `inode` must be the file and inode for a file that is undergoing initialization.
> -/// The file must be associated with a `MiscDeviceRegistration<T>`.
> -unsafe extern "C" fn fops_open<T: MiscDevice>(
> -    inode: *mut bindings::inode,
> -    raw_file: *mut bindings::file,
> -) -> c_int {
> -    // SAFETY: The pointers are valid and for a file being opened.
> -    let ret = unsafe { bindings::generic_file_open(inode, raw_file) };
> -    if ret != 0 {
> -        return ret;
> -    }
> +        // SAFETY:
> +        // * This underlying file is valid for (much longer than) the duration of `T::open`.
> +        // * There is no active fdget_pos region on the file on this thread.
> +        let file = unsafe { File::from_raw_file(raw_file) };
>  
> -    // SAFETY: The open call of a file can access the private data.
> -    let misc_ptr = unsafe { (*raw_file).private_data };
> -
> -    // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
> -    // associated `struct miscdevice` before calling into this method. Furthermore, `misc_open()`
> -    // ensures that the miscdevice can't be unregistered and freed during this call to `fops_open`.
> -    let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
> +        let ptr = match T::open(file, misc) {
> +            Ok(ptr) => ptr,
> +            Err(err) => return err.to_errno(),
> +        };
>  
> -    // SAFETY:
> -    // * This underlying file is valid for (much longer than) the duration of `T::open`.
> -    // * There is no active fdget_pos region on the file on this thread.
> -    let file = unsafe { File::from_raw_file(raw_file) };
> +        // This overwrites the private data with the value specified by the user, changing the type of
> +        // this file's private data. All future accesses to the private data is performed by other
> +        // fops_* methods in this file, which all correctly cast the private data to the new type.
> +        //
> +        // SAFETY: The open call of a file can access the private data.
> +        unsafe { (*raw_file).private_data = ptr.into_foreign().cast_mut() };
>  
> -    let ptr = match T::open(file, misc) {
> -        Ok(ptr) => ptr,
> -        Err(err) => return err.to_errno(),
> -    };
> -
> -    // This overwrites the private data with the value specified by the user, changing the type of
> -    // this file's private data. All future accesses to the private data is performed by other
> -    // fops_* methods in this file, which all correctly cast the private data to the new type.
> -    //
> -    // SAFETY: The open call of a file can access the private data.
> -    unsafe { (*raw_file).private_data = ptr.into_foreign().cast_mut() };
> +        0
> +    }
>  
> -    0
> -}
> +    /// # Safety
> +    ///
> +    /// `file` and `inode` must be the file and inode for a file that is being released. The file must
> +    /// be associated with a `MiscDeviceRegistration<T>`.
> +    unsafe extern "C" fn release(_inode: *mut bindings::inode, file: *mut bindings::file) -> c_int {
> +        // SAFETY: The release call of a file owns the private data.
> +        let private = unsafe { (*file).private_data };
> +        // SAFETY: The release call of a file owns the private data.
> +        let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
> +
> +        // SAFETY:
> +        // * The file is valid for the duration of this call.
> +        // * There is no active fdget_pos region on the file on this thread.
> +        T::release(ptr, unsafe { File::from_raw_file(file) });
> +
> +        0
> +    }
>  
> -/// # Safety
> -///
> -/// `file` and `inode` must be the file and inode for a file that is being released. The file must
> -/// be associated with a `MiscDeviceRegistration<T>`.
> -unsafe extern "C" fn fops_release<T: MiscDevice>(
> -    _inode: *mut bindings::inode,
> -    file: *mut bindings::file,
> -) -> c_int {
> -    // SAFETY: The release call of a file owns the private data.
> -    let private = unsafe { (*file).private_data };
> -    // SAFETY: The release call of a file owns the private data.
> -    let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
> -
> -    // SAFETY:
> -    // * The file is valid for the duration of this call.
> -    // * There is no active fdget_pos region on the file on this thread.
> -    T::release(ptr, unsafe { File::from_raw_file(file) });
> -
> -    0
> -}
> +    /// # Safety
> +    ///
> +    /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
> +    unsafe extern "C" fn ioctl(file: *mut bindings::file, cmd: c_uint, arg: c_ulong) -> c_long {
> +        // SAFETY: The ioctl call of a file can access the private data.
> +        let private = unsafe { (*file).private_data };
> +        // SAFETY: Ioctl calls can borrow the private data of the file.
> +        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
> +
> +        // SAFETY:
> +        // * The file is valid for the duration of this call.
> +        // * There is no active fdget_pos region on the file on this thread.
> +        let file = unsafe { File::from_raw_file(file) };
> +
> +        match T::ioctl(device, file, cmd, arg as usize) {
> +            Ok(ret) => ret as c_long,
> +            Err(err) => err.to_errno() as c_long,
> +        }
> +    }
>  
> -/// # Safety
> -///
> -/// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
> -unsafe extern "C" fn fops_ioctl<T: MiscDevice>(
> -    file: *mut bindings::file,
> -    cmd: c_uint,
> -    arg: c_ulong,
> -) -> c_long {
> -    // SAFETY: The ioctl call of a file can access the private data.
> -    let private = unsafe { (*file).private_data };
> -    // SAFETY: Ioctl calls can borrow the private data of the file.
> -    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
> -
> -    // SAFETY:
> -    // * The file is valid for the duration of this call.
> -    // * There is no active fdget_pos region on the file on this thread.
> -    let file = unsafe { File::from_raw_file(file) };
> -
> -    match T::ioctl(device, file, cmd, arg as usize) {
> -        Ok(ret) => ret as c_long,
> -        Err(err) => err.to_errno() as c_long,
> +    /// # Safety
> +    ///
> +    /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
> +    #[cfg(CONFIG_COMPAT)]
> +    unsafe extern "C" fn compat_ioctl(
> +        file: *mut bindings::file,
> +        cmd: c_uint,
> +        arg: c_ulong,
> +    ) -> c_long {
> +        // SAFETY: The compat ioctl call of a file can access the private data.
> +        let private = unsafe { (*file).private_data };
> +        // SAFETY: Ioctl calls can borrow the private data of the file.
> +        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
> +
> +        // SAFETY:
> +        // * The file is valid for the duration of this call.
> +        // * There is no active fdget_pos region on the file on this thread.
> +        let file = unsafe { File::from_raw_file(file) };
> +
> +        match T::compat_ioctl(device, file, cmd, arg as usize) {
> +            Ok(ret) => ret as c_long,
> +            Err(err) => err.to_errno() as c_long,
> +        }
>      }
> -}
>  
> -/// # Safety
> -///
> -/// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
> -#[cfg(CONFIG_COMPAT)]
> -unsafe extern "C" fn fops_compat_ioctl<T: MiscDevice>(
> -    file: *mut bindings::file,
> -    cmd: c_uint,
> -    arg: c_ulong,
> -) -> c_long {
> -    // SAFETY: The compat ioctl call of a file can access the private data.
> -    let private = unsafe { (*file).private_data };
> -    // SAFETY: Ioctl calls can borrow the private data of the file.
> -    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
> -
> -    // SAFETY:
> -    // * The file is valid for the duration of this call.
> -    // * There is no active fdget_pos region on the file on this thread.
> -    let file = unsafe { File::from_raw_file(file) };
> -
> -    match T::compat_ioctl(device, file, cmd, arg as usize) {
> -        Ok(ret) => ret as c_long,
> -        Err(err) => err.to_errno() as c_long,
> +    /// # Safety
> +    ///
> +    /// - `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
> +    /// - `seq_file` must be a valid `struct seq_file` that we can write to.
> +    unsafe extern "C" fn show_fdinfo(seq_file: *mut bindings::seq_file, file: *mut bindings::file) {
> +        // SAFETY: The release call of a file owns the private data.
> +        let private = unsafe { (*file).private_data };
> +        // SAFETY: Ioctl calls can borrow the private data of the file.
> +        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
> +        // SAFETY:
> +        // * The file is valid for the duration of this call.
> +        // * There is no active fdget_pos region on the file on this thread.
> +        let file = unsafe { File::from_raw_file(file) };
> +        // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
> +        // this method is called.
> +        let m = unsafe { SeqFile::from_raw(seq_file) };
> +
> +        T::show_fdinfo(device, m, file);
>      }
> -}
>  
> -/// # Safety
> -///
> -/// - `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
> -/// - `seq_file` must be a valid `struct seq_file` that we can write to.
> -unsafe extern "C" fn fops_show_fdinfo<T: MiscDevice>(
> -    seq_file: *mut bindings::seq_file,
> -    file: *mut bindings::file,
> -) {
> -    // SAFETY: The release call of a file owns the private data.
> -    let private = unsafe { (*file).private_data };
> -    // SAFETY: Ioctl calls can borrow the private data of the file.
> -    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
> -    // SAFETY:
> -    // * The file is valid for the duration of this call.
> -    // * There is no active fdget_pos region on the file on this thread.
> -    let file = unsafe { File::from_raw_file(file) };
> -    // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
> -    // this method is called.
> -    let m = unsafe { SeqFile::from_raw(seq_file) };
> -
> -    T::show_fdinfo(device, m, file);
> +    const VTABLE: bindings::file_operations = bindings::file_operations {
> +        open: Some(Self::open),
> +        release: Some(Self::release),
> +        unlocked_ioctl: if T::HAS_IOCTL {
> +            Some(Self::ioctl)
> +        } else {
> +            None
> +        },
> +        #[cfg(CONFIG_COMPAT)]
> +        compat_ioctl: if T::HAS_COMPAT_IOCTL {
> +            Some(Self::compat_ioctl)
> +        } else if T::HAS_IOCTL {
> +            Some(Self::bindings::compat_ptr_ioctl)
> +        } else {
> +            None
> +        },
> +        show_fdinfo: if T::HAS_SHOW_FDINFO {
> +            Some(Self::show_fdinfo)
> +        } else {
> +            None
> +        },
> +        // SAFETY: All zeros is a valid value for `bindings::file_operations`.
> +        ..unsafe { MaybeUninit::zeroed().assume_init() }
> +    };
> +
> +    const fn build() -> &'static bindings::file_operations {
> +        &Self::VTABLE
> +    }
>  }
> 
> ---
> base-commit: 01b3cb620815fc3feb90ee117d9445a5b608a9f7
> change-id: 20250117-miscdevice-fops-change-260352fd8957
> 
> Best regards,

